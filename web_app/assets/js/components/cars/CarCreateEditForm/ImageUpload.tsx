import React, {useState, useEffect, useRef, FC} from 'react'
import { useDropzone, FileRejection } from 'react-dropzone'
import { ReactSortable } from "react-sortablejs"

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faXmark } from '@fortawesome/free-solid-svg-icons'
import { faArrowUpRightFromSquare } from '@fortawesome/free-solid-svg-icons'
import GetColorProps from '../../../common/interfaces/function_arguments/GetColorProps'
import ImageUploadProps from '../../../common/interfaces/properties/ImageUploadProps'

import '../../../../scss/components/image-upload.scss'

const getColor = (props: GetColorProps) => {
  if (props.isDragAccept) {
      return '#00e676'
  }
  if (props.isDragReject) {
      return '#ff1744'
  }
  if (props.isFocused) {
      return '#2196f3'
  }
  return '#eeeeee'
}

async function createFileFromUrl(url: string): Promise<File> {
  const response: Response = await fetch(url)
  const responseData: Blob = await response.blob()

  const extension: string = url.split('.').pop()
  let mimeType: string = `image/${extension}`
  if (extension === 'jpg') mimeType = 'image/jpeg' // So far the only extension which has more specific mime type.

  return new File([responseData], `img.${extension}`, {
      type: mimeType
  })
}

function extractThumbnailUrl(fileList: Array<File>) {
  return fileList.map((file: File) => Object.assign(file, {
    preview: URL.createObjectURL(file)
  }))
}

const ImageUpload: FC<ImageUploadProps> = ({imgUrls}) => {
  const [files, setFiles] = useState([])
  const [base64Urls, setBase64Urls] = useState<Array<Text>>([]) // Helps with setting data in hidden field.
  const rendersCountRef = useRef<number>(0)
  rendersCountRef.current += 1; // Increment on each render.
  const maxImageSize: number = 50 * 1024 * 1024 // It will be compressed in the backend but having max size will define the compressed image max size.

  const {getRootProps, getInputProps, isFocused, isDragAccept, isDragReject} = useDropzone({
    accept: {
      'image/*': []
    },
    maxSize: maxImageSize,
    onDrop: (acceptedFiles): void => {
      let fileList = [...files, ...acceptedFiles]

      if (fileList.length > 16) {
        alert('Не се допускат повече от 16 изображения.')
        fileList = fileList.slice(0, 16)
      }

      setFiles(extractThumbnailUrl(fileList))
    },
    onDropRejected: (rejections: Array<FileRejection>): void => {
      rejections.forEach((rejection: FileRejection) => {
        if (rejection.file.size > maxImageSize) {
          alert('Изображения с размер над 7 мегабайта не са позволени.')
        }
      })
    }
  })

  useEffect(() => {
    // On first render convert image urls to files 
    Promise.all(imgUrls.map((imgUrl: string) => createFileFromUrl(imgUrl)))
      .then((fileList: Array<File>) => setFiles(extractThumbnailUrl(fileList)))
  }, [])

  
  useEffect(() => {

    let renderBeforeFinishing: number = rendersCountRef.current
  
    Promise.all(files.map(file => new Promise((resolve, reject) => {
      const reader: FileReader = new FileReader()
      reader.readAsDataURL(file)
      reader.onload = () => resolve(reader.result)
    })))
      .then((base64Urls: Array<Text>) => {
        // Don't continue if component has rendered while waiting for all promises to finish.
        // This prevents a bug in which removing the last image leads to not having base64Urls empty array.
        if (renderBeforeFinishing != rendersCountRef.current) return
        
        setBase64Urls(base64Urls)
      })
  }, [files])

  function onRemoveThumbnailClick(fileToRemoveIndex: number) {
    setFiles(files.filter((file: File, index: number) => index !== fileToRemoveIndex))
  }

  function onExpandThumbnailClick(index:number) {
    window.open(files[index].preview)
  }
  
  return (
    <section>
      <aside className='thumbs-container'>
        <ReactSortable list={files} setList={setFiles}>
          {
          files.map((item, index: number) => (
            <div className='thumb-item' key={item.name + index}>
              <div>
                <img src={item.preview} />
              </div>
              <div className='action-button expand-image' onClick={() => onExpandThumbnailClick(index)}>
                <FontAwesomeIcon icon={faArrowUpRightFromSquare} />
              </div>
              <div className='action-button remove-thumbnail' onClick={() => onRemoveThumbnailClick(index)}>
                <FontAwesomeIcon icon={faXmark} />
              </div>
            </div>
          ))}
        </ReactSortable>
      </aside>
      <div {...getRootProps({className: 'dropzone'})} style={{borderColor: getColor({isFocused, isDragAccept, isDragReject})}}>
        <input {...getInputProps()} />
        <p className='mb-0'>Качване на снимки</p>
      </div>
      
      <input name="image_urls" type='hidden' value={JSON.stringify(base64Urls)} />
    </section>
  )
}

export default ImageUpload