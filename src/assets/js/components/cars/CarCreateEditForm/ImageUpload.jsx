import React, {useState, useEffect, useRef} from 'react'
import {useDropzone} from 'react-dropzone'
import { ReactSortable } from "react-sortablejs"

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faXmark } from '@fortawesome/free-solid-svg-icons'
import { faArrowUpRightFromSquare } from '@fortawesome/free-solid-svg-icons'

import '../../../../scss/components/image-upload.scss'

const getColor = (props) => {
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

async function createFileFromUrl(url){
  const response = await fetch(url)
  const data = await response.blob()

  const extension = url.split('.').pop()
  let mimeType = `image/${extension}`
  if (extension === 'jpg') mimeType = 'image/jpeg' // So far the only extension which has more specific mime type.

  return new File([data], `img.${extension}`, {
      type: mimeType
  })
}

function extractThumbnailUrl(fileList) {
  return fileList.map(file => Object.assign(file, {
    preview: URL.createObjectURL(file)
  }))
}

export default function ImageUpload({imgUrls}) {
  const [files, setFiles] = useState([])
  const [base64Urls, setBase64Urls] = useState([]) // Helps with setting data in hidden field.
  const rendersCountRef = useRef(0)
  rendersCountRef.current += 1; // Increment on each render.
  const maxImageSize = 50 * 1024 * 1024 // It will be compressed in the backend but having max size will define the compressed image max size.

  const {getRootProps, getInputProps, isFocused, isDragAccept, isDragReject} = useDropzone({
    accept: {
      'image/*': []
    },
    maxSize: maxImageSize,
    onDrop: acceptedFiles => {
      let fileList = [...files, ...acceptedFiles]

      if (fileList.length > 16) {
        alert('Не се допускат повече от 16 изображения.')
        fileList = fileList.slice(0, 16)
      }

      setFiles(extractThumbnailUrl(fileList))
    },
    onDropRejected: rejections => {
      rejections.forEach(rejection => {
        if (rejection.file.size > maxImageSize) {
          alert('Изображения с размер над 7 мегабайта не са позволени.')
        }
      })
    }
  })

  useEffect(() => {
    // On first render convert image urls to files 
    Promise.all(imgUrls.map(imgUrl => createFileFromUrl(imgUrl)))
      .then(fileList => setFiles(extractThumbnailUrl(fileList)))
  }, [])

  
  useEffect(() => {

    let renderBeforeFinishing = rendersCountRef.current
  
    Promise.all(files.map(file => new Promise((resolve, reject) => {
      const reader = new FileReader()
      reader.readAsDataURL(file)
      reader.onload = () => resolve(reader.result)
    })))
      .then(base64Urls => {
        // Don't continue if component has rendered while waiting for all promises to finish.
        // This prevents a bug in which removing the last image leads to not having base64Urls empty array.
        if (renderBeforeFinishing != rendersCountRef.current) return
        
        setBase64Urls(base64Urls)
      })
  }, [files])

  function onRemoveThumbnailClick(fileToRemoveIndex) {
    setFiles(files.filter((file, index) => index !== fileToRemoveIndex))
  }

  function onExpandThumbnailClick(index) {
    window.open(files[index].preview)
  }
  
  return (
    <section>
      <aside className='thumbs-container'>
        <ReactSortable list={files} setList={setFiles}>
          {
          files.map((item, index) => (
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