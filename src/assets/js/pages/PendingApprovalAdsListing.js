import React from 'react'
import ReactDOM from 'react-dom/client'
import CarsList from '../components/cars/CarsList'

let PendingApprovalAdsListing = {
    'init': () => {

        if (document.body.getAttribute('id') === 'pending-approval-ads') {
            
            ReactDOM
                .createRoot(document.getElementById('pending-approval-ads-list'))
                .render(<CarsList showPaginator={true} 
                    apiUrl={fromPHP.vehicleListDataUrl + '?context=pending_approval'}
                    page={(new URL(window.location.href)).searchParams.get('page') || 1}
                    />)
        }
    }
}

export default PendingApprovalAdsListing