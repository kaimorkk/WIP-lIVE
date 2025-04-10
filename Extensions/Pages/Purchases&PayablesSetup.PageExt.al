PageExtension 52193504 pageextension52193504 extends "Purchases & Payables Setup" 
{
    layout
    {

        //Unsupported feature: Property Modification (SourceExpr) on ""Allow Document Deletion Before"(Control 35)".


        //Unsupported feature: Property Modification (Name) on ""Allow Document Deletion Before"(Control 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Allow Document Deletion Before"(Control 35)".


        //Unsupported feature: Property Deletion (Importance) on ""Allow Document Deletion Before"(Control 35)".

        addafter("Default Qty. to Receive")
        {
            field("RFQ Documents Path";"RFQ Documents Path")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Posted Prepmt. Cr. Memo Nos.")
        {
            field("Purchase Req No";"Purchase Req No")
            {
                ApplicationArea = Basic;
            }
            field("Effective Procurement Plan";"Effective Procurement Plan")
            {
                ApplicationArea = Basic;
            }
            field("Store Requisition Nos.";"Store Requisition Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Appointment Nos.";"Appointment Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Request for Quotation Nos.";"Request for Quotation Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Request for Proposals Nos.";"Request for Proposals Nos.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Allow Document Deletion Before")
        {
            field("Inspection Nos";"Inspection Nos")
            {
                ApplicationArea = Basic;
            }
            field("Store Return Nos";"Store Return Nos")
            {
                ApplicationArea = Basic;
            }
            field("Order Duration";"Order Duration")
            {
                ApplicationArea = Basic;
            }
            field("Quote Evaluation Nos";"Quote Evaluation Nos")
            {
                ApplicationArea = Basic;
            }
            field("Contract Expiry Duration";"Contract Expiry Duration")
            {
                ApplicationArea = Basic;
            }
            field("Stores Issuer";"Stores Issuer")
            {
                ApplicationArea = Basic;
            }
            field("Finance Notification";"Finance Notification")
            {
                ApplicationArea = Basic;
            }
            field("Item Issue Journal Template";"Item Issue Journal Template")
            {
                ApplicationArea = Basic;
            }
            field("Send Payment Notification";"Send Payment Notification")
            {
                ApplicationArea = Basic;
            }
            field("Expression of Interest Nos.";"Expression of Interest Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Due Period";"Due Period")
            {
                ApplicationArea = Basic;
            }
            field("Payment Due Notification Email";"Payment Due Notification Email")
            {
                ApplicationArea = Basic;
            }
            field("Penalty Amount Per Day";"Penalty Amount Per Day")
            {
                ApplicationArea = Basic;
            }
            field("Transaction Nos.";"Transaction Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Treasury Nos.";"Treasury Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Standing Orders Nos.";"Standing Orders Nos.")
            {
                ApplicationArea = Basic;
            }
            field("FOSA Current Account";"FOSA Current Account")
            {
                ApplicationArea = Basic;
            }
            field("BOSA Current Account";"BOSA Current Account")
            {
                ApplicationArea = Basic;
            }
            field("Teller Transactions No";"Teller Transactions No")
            {
                ApplicationArea = Basic;
            }
            field("Treasury Transactions No";"Treasury Transactions No")
            {
                ApplicationArea = Basic;
            }
            field("Applicants Nos.";"Applicants Nos.")
            {
                ApplicationArea = Basic;
            }
            field("STO Register No";"STO Register No")
            {
                ApplicationArea = Basic;
            }
            field("EFT Header Nos.";"EFT Header Nos.")
            {
                ApplicationArea = Basic;
            }
            field("EFT Details Nos.";"EFT Details Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Salaries Nos.";"Salaries Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Normal Cheque Transfers Nos";"Normal Cheque Transfers Nos")
            {
                ApplicationArea = Basic;
            }
            field("Direct Prcmnt Nos";"Direct Prcmnt Nos")
            {
                ApplicationArea = Basic;
            }
            field("PDF Docs Path";"PDF Docs Path")
            {
                ApplicationArea = Basic;
            }
            field("Asset Disposal Nos";"Asset Disposal Nos")
            {
                ApplicationArea = Basic;
            }
            field("Contract Notification Email";"Contract Notification Email")
            {
                ApplicationArea = Basic;
            }
            field("Low Value Prcmnt Nos";"Low Value Prcmnt Nos")
            {
                ApplicationArea = Basic;
            }
            field("Specially Permitted Prcmnt Nos";"Specially Permitted Prcmnt Nos")
            {
                ApplicationArea = Basic;
            }
        }
       
    }
}

