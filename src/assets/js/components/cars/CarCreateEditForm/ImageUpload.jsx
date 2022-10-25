import React, {useEffect, useState} from 'react'
import {useDropzone} from 'react-dropzone'
import { ReactSortable } from "react-sortablejs";

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

  return (
    <section>
      <div {...getRootProps({className: 'dropzone'})} style={{borderColor: getColor({isFocused, isDragAccept, isDragReject})}}>
        <input {...getInputProps()} />
        <p className='mb-0'>Качване на снимки</p>
      </div>
      <aside className='thumbs-container'>
        <ReactSortable list={files} setList={setFiles}>
          {
          files.map((item, index) => (
            <div className='thumb-item' key={item.name + index}>
              <div>{console.log(item.name + index)}
                <img src={item.preview}
                />
              </div>
            </div>
          ))}
        </ReactSortable>
      </aside>
    </section>
  )
}