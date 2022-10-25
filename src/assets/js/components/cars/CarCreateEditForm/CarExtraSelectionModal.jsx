import React, {useRef} from 'react'
import Button from 'react-bootstrap/Button'
import Modal from 'react-bootstrap/Modal'

import '../../../../scss/components/extras-modal.scss'

export default function CarExtraSelectionModal(props) {

  const formRef = useRef(null)

  function handleClose() {
    props.onHide()
  }

  return (
    <Modal show={props.show} onHide={handleClose} className='extra-modal'>
      <Modal.Header closeButton>
        <Modal.Title>Избери екстри</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <form ref={formRef}>
          {props.extras.map((extra, index) => <div className="form-check mb-2" key={index}>
            <label className="form-check-label w-100">
              <input type="checkbox" name="car_extras[]" className="form-check-input" value={extra.id} defaultChecked={extra.selected} />
              {extra.name}
            </label>
          </div>)}
        </form>
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary" onClick={handleClose}>
          Откажи
        </Button>
        <Button variant="primary" onClick={() => props.onSave(new FormData(formRef.current).getAll('car_extras[]'))}>
          Запази
        </Button>
      </Modal.Footer>
    </Modal>
  )
}