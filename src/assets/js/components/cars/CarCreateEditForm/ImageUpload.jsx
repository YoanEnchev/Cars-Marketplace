import React, {useState} from 'react'
import {useDropzone} from 'react-dropzone'
import { ReactSortable } from "react-sortablejs";

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faXmark } from '@fortawesome/free-solid-svg-icons'
import { faArrowUpRightFromSquare } from '@fortawesome/free-solid-svg-icons'

import '../../../../scss/components/image-upload.scss'

const getColor = (props) => {
  if (props.isDragAccept) {
      return '#00e676';
  }
  if (props.isDragReject) {
      return '#ff1744';
  }
  if (props.isFocused) {
      return '#2196f3';
  }
  return '#eeeeee';
}

export default function ImageUpload(props) {
  const [files, setFiles] = useState([])
  const {getRootProps, getInputProps, isFocused, isDragAccept, isDragReject} = useDropzone({
    accept: {
      'image/*': []
    },
    onDrop: acceptedFiles => {
      let fileList = [...files, ...acceptedFiles]

      if (fileList.length > 16) {
        alert('Max 16 images are allowed')
        fileList = fileList.slice(0, 16)
      }

      setFiles(fileList.map(file => Object.assign(file, {
        preview: URL.createObjectURL(file)
      })))
    }
  })

  function onRemoveThumbnailClick(fileToRemoveIndex) {
    setFiles(files.filter((file, index) => index !== fileToRemoveIndex))
  }

  function onExpandThumbnailClick(index) {
    window.open(files[index].preview);
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
    </section>
  )
}