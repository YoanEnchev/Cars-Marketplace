import React, { FC } from 'react'
import PaginatorProps from '../../common/interfaces/properties/PaginatorProps'

const Paginator: FC<PaginatorProps> = ({totalPages, currentPage, onPageChange}) => {

    // 2 is the amount of pages to the left and right of current page.
    // For example if current page is 5.
    // Then left pages would 3 and 4.
    // And the right pages would be 6 and 7

    let leftPages: Array<number> = [] // Pages from the left of active page (like 1 and 2 when active page is 3).
    let rightPages:  Array<number> = [] // Pages from the right of active page (like 4 and 5 when active page is 3).

    if (currentPage - 2 > 0) leftPages.push(currentPage - 2)
    if (currentPage - 1 > 0) leftPages.push(currentPage - 1)

    if (currentPage + 1 <= totalPages) rightPages.push(currentPage + 1)
    if (currentPage + 2 <= totalPages) rightPages.push(currentPage + 2)

    return <nav aria-label="Page navigation example">
        <ul className="pagination">
            { currentPage > 1 ?
            <li className="page-item" onClick={() => onPageChange(currentPage - 1)}>
                <a className="page-link" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li> : '' }

            {leftPages.map((page: number) => (<li className="page-item" key={page} onClick={() => onPageChange(page)}>
                <a className="page-link">{page}</a>
            </li>))}

            <li className="page-item active" key={currentPage} onClick={() => onPageChange(currentPage)}>
                <a className="page-link">{currentPage}</a>
            </li>

            {rightPages.map((page: number) => (<li className="page-item" key={page} onClick={() => onPageChange(page)}>
                <a className="page-link">{page}</a>
            </li>))}

            { currentPage < totalPages ?
            <li className="page-item" onClick={() => onPageChange(currentPage + 1)}>
                <a className="page-link" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li> : ''}
        </ul>
    </nav>
}

export default Paginator