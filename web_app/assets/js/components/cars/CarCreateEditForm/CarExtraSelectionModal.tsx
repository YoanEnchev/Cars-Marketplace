import React, {useRef, FC} from 'react'
import Button from 'react-bootstrap/Button'
import Modal from 'react-bootstrap/Modal'

import '../../../../scss/components/extras-modal.scss'
import ExtraCategoryItemInterface from '../../../common/interfaces/models/ExtraCategoryItemInterface'
import CarExtraSelectionModalProps from '../../../common/interfaces/properties/CarExtraSelectionModalProps'

const CarExtraSelectionModal: FC<CarExtraSelectionModalProps> = ({onHide, onSave, show, extras}) => {

  const formRef = useRef<HTMLFormElement>(null)

  return (
    <Modal show={show} onHide={() => onHide()} className='extra-modal'>
      <Modal.Header closeButton>
        <Modal.Title>Избери екстри</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <form ref={formRef}>
          {extras.map((extra: ExtraCategoryItemInterface, index: number) => <div className="form-check mb-2" key={index}>
            <label className="form-check-label w-100">
              <input type="checkbox" name="car_extras[]" className="form-check-input" value={extra.id + ''} defaultChecked={extra.selected} />
              {extra.title}
            </label>
          </div>)}
        </form>
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary" onClick={() => onHide()}>
          Откажи
        </Button>
        <Button variant="primary" onClick={() => onSave(new FormData(formRef.current)
            .getAll('car_extras[]')
            .map((value: string) => parseInt(value)) // In this case val is a numeric string (like '1') before parsing.
            )}>
          Запази
        </Button>
      </Modal.Footer>
    </Modal>
  )
}

export default CarExtraSelectionModal;