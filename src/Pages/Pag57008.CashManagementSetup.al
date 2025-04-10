page 57008 "Cash Management Setup"
{
    PageType = Card;
    SourceTable = "Cash Management Setup";
    UsageCategory = Administration;
    ApplicationArea = All;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("PV Journal Template"; Rec."PV Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PV Journal Template field.';
                }
                field("PV Journal Batch Name"; Rec."PV Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PV Journal Batch Name field.';
                }
                field("PS Journal Template"; Rec."PS Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PS Journal Template field.';
                }
                field("PS Journal Batch Name"; Rec."PS Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PS Journal Batch Name field.';
                }
                field("Imprest Journal Template"; Rec."Imprest Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Journal Template field.';
                }
                field("IMPREST Journal Batch Name"; Rec."IMPREST Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IMPREST Journal Batch Name field.';
                }
                field("Imp Voucher Journal Template"; Rec."Imp Voucher Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imp Voucher Journal Template field.';
                }
                field("Imp Voucher Journal Batch Name"; Rec."Imp Voucher Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imp Voucher Journal Batch Name field.';
                }
                field("Imprest Surrender Template"; Rec."Imprest Surrender Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Surrender Template field.';
                }
                field("Petty Cash Surrender Template"; Rec."Petty Cash Surrender Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Surrender Template field.';
                }
                field("IMPREST SUR Journal Batch Name"; Rec."IMPREST SUR Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IMPREST SUR Journal Batch Name field.';
                }
                field("PCASH Journal Template"; Rec."PCASH Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PCASH Journal Template field.';
                }
                field("PCASH Journal Batch Name"; Rec."PCASH Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PCASH Journal Batch Name field.';
                }
                field("Bank TR Journal Template"; Rec."Bank TR Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank TR Journal Template field.';
                }
                field("Bank TR Journal Batch Name"; Rec."Bank TR Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank TR Journal Batch Name field.';
                }
                field("Receipt Template"; Rec."Receipt Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Template field.';
                }
                field("Receipt Batch Name"; Rec."Receipt Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Batch Name field.';
                }
                field("Lock Imprest Application"; Rec."Lock Imprest Application")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lock Imprest Application field.';
                }
                field("Post VAT"; Rec."Post VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post VAT field.';
                }
                field("Rounding Type"; Rec."Rounding Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rounding Type field.';
                }
                field("Rounding Precision"; Rec."Rounding Precision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rounding Precision field.';
                }
                field("Imprest Limit"; Rec."Imprest Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Limit field.';
                }
                field("Imprest Due Date"; Rec."Imprest Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Due Date field.';
                }
                field("Petty Cash Limit"; Rec."Petty Cash Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Limit field.';
                }
                field("Staff Claim Journal Template"; Rec."Staff Claim Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Claim Journal Template field.';
                }
                field("Staff Claim Journal Batch Name"; Rec."Staff Claim Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Claim Journal Batch Name field.';
                }

                field("Send Email Notification"; Rec."Send Email Notification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Send Email Notification field.';
                }

                field("Current Budget"; Rec."Current Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budget field.';
                }
                field("Current Budget Start Date"; Rec."Current Budget Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budget Start Date field.';
                }
                field("Current Budget End Date"; Rec."Current Budget End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budget End Date field.';
                }
                field("Budget Controller Email"; Rec."Budget Controller Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Controller Email field.';
                }
                field("Imprest Posting Group"; Rec."Imprest Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Posting Group field.';
                }
                field("General Bus. Posting Group"; Rec."General Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Bus. Posting Group field.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Bus. Posting Group field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field("VAT. Prod. Posting Group"; Rec."VAT. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT. Prod. Posting Group field.';
                }
                field("Check for Committment"; Rec."Check for Committment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Check for Committment field.';
                }
                field("Fuel Market Price"; Rec."Fuel Market Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Market Price field.';
                }
                field("Imprest Email"; Rec."Imprest Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Email field.';
                }
                field("Tax Threshhold"; Rec."Tax Threshhold")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Threshhold field.';
                }
                field("Tax Rate"; Rec."Tax Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Rate field.';
                }
                field("Standing Imp Journal Template"; Rec."Standing Imp Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Standing Imp Journal Template field.';
                }
                field("StandingImp Journal Batch Name"; Rec."StandingImp Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the StandingImp Journal Batch Name field.';
                }

                field("Salary Adv Journal Template"; Rec."Salary Adv Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Adv Journal Template field.';
                }
                field("Salary Adv Journal Batch Name"; Rec."Salary Adv Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Adv Journal Batch Name field.';
                }
                field("Prepayment Account"; Rec."Prepayment Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prepayment Account field.';
                }
                field("Warrant Voucher Default Payabl"; Rec."Warrant Voucher Default Payabl")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Warrant Voucher Default Payabl field.';
                }
                field("Car Loan Journal Template"; Rec."Car Loan Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Car Loan Journal Template field.';
                }
                field("Car Loan Journal Batch Name"; Rec."Car Loan Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Car Loan Journal Batch Name field.';
                }
                field("Car Loan Temp Acc"; Rec."Car Loan Temp Acc")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Car Loan Temp Acc field.';
                }
                field("Default Bank Acc. Type By"; "Default Bank Acc. Type By")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the criteria to be used to fetch default Bank Account';
                }
                field("Imprest Bank Account"; "Imprest Bank Account")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
            group(Numbering)
            {
                field("PV File Numbering"; Rec."PV File Numbering")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PV File Numbering field.';
                }
                field("Staff Claim Nos."; Rec."Staff Claim Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Claim Nos. field.';
                }
                field("EFT Header Nos."; Rec."EFT Header Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EFT Header Nos. field.';
                }
                field("EFT Details Nos."; Rec."EFT Details Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EFT Details Nos. field.';
                }
                field("PV Nos"; Rec."PV Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PV Nos field.';
                }
                field("Refund Nos"; Rec."Refund Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Schedule Nos"; Rec."Payment Schedule Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Schedule Nos field.';
                }
                field("Petty Cash Nos"; Rec."Petty Cash Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Nos field.';
                }
                field("Petty Cash Surrender Nos"; Rec."Petty Cash Surrender Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Surrender Nos field.';
                }
                field("Imprest Memo Nos"; Rec."Imprest Memo Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Memo Nos field.';
                }
                field("Imprest Nos"; Rec."Imprest Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Nos field.';
                }
                field("Imprest Surrender Nos"; Rec."Imprest Surrender Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Surrender Nos field.';
                }
                field("Imprest Surr Memo Nos"; Rec."Imprest Surr Memo Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Surr Memo Nos field.';
                }
                field("Special Imprest Nos"; "Special Imprest Nos")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Receipt Nos"; Rec."Receipt Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Nos field.';
                }
                field("Bank Transfer Nos"; Rec."Bank Transfer Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Transfer Nos field.';
                }
                field("Standing Imprest Nos"; Rec."Standing Imprest Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Standing Imprest Nos field.';
                }
                field("Standing Imprest Surrender Nos"; Rec."Standing Imprest Surrender Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Standing Imprest Surrender Nos field.';
                }
                field("Salary Advance Nos"; Rec."Salary Advance Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Advance Nos field.';
                }
                field("Prepayment Nos."; Rec."Prepayment Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prepayment Nos. field.';
                }
                field("Car loan Nos"; Rec."Car loan Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Car loan Nos field.';
                }
                field("Document CheckList Nos"; "Document CheckList Nos")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Revenue Receipt Nos"; "Revenue Receipt Nos")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Deposit Receipt Nos"; "Deposit Receipt Nos")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Utilization Receipt Nos"; "Utilization Receipt Nos")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Retention Receipt Nos"; "Retention Receipt Nos")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("AIE Receipt Nos"; Rec."AIE Receipt Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the AIE Receipt Nos field.', Comment = '%';
                }
                field("Revenue Sweep Nos"; "Revenue Sweep Nos")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Exchequer Request Nos"; "Exchequer Request Nos")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
            group("Reversal Nos Series")
            {
                Caption = 'Reversal Nos Series';
                field("PV Reversal Nos"; Rec."PV Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PV Reversal Nos field.';
                }
                field("Petty Cash Reversal Nos"; Rec."Petty Cash Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Reversal Nos field.';
                }
                field("Imprest Reversal Nos"; Rec."Imprest Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Reversal Nos field.';
                }
                field("Bank Transfer Reversal Nos"; Rec."Bank Transfer Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Transfer Reversal Nos field.';
                }
                field("Receipt Reversal Nos"; Rec."Receipt Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Reversal Nos field.';
                }
                field("Imprest Surrender Reversal Nos"; Rec."Imprest Surrender Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Surrender Reversal Nos field.';
                }
                field("Imprest Surr Memo Reversal Nos"; Rec."Imprest Surr Memo Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Surr Memo Reversal Nos field.';
                }
                field("Staff Claim Reversal Nos."; Rec."Staff Claim Reversal Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Claim Reversal Nos. field.';
                }
                field("Standing Imprest Reversal Nos"; Rec."Standing Imprest Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Standing Imprest Reversal Nos field.';
                }
                field("Salary Advance Reversal Nos"; Rec."Salary Advance Reversal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Advance Reversal Nos field.';
                }
            }
            group("SharePoint Intergration")
            {
                Caption = 'SharePoint Intergration';
                field("SharePoint Site UserName"; Rec."SharePoint Site UserName")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SharePoint Site UserName field.';
                }
                field("SharePoint Site Password"; Rec."SharePoint Site Password")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SharePoint Site Password field.';
                }
                field("SharePoint Site Domain Name"; Rec."SharePoint Site Domain Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SharePoint Site Domain Name field.';
                }
                field("SharePoint Site Link"; Rec."SharePoint Site Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SharePoint Site Link field.';
                }
                field("SharePoint Site Main Library"; Rec."SharePoint Site Main Library")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SharePoint Site Main Library field.';
                }
                field("SharePoint Document Library"; Rec."SharePoint Document Library")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SharePoint Document Library field.';
                }
                field("Staff Claims DMS Link"; Rec."Staff Claims DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Claims DMS Link field.';
                }
                field("Imprest Memo DMS Link"; Rec."Imprest Memo DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Memo DMS Link field.';
                }
                field("Imprest Requisition DMS Link"; Rec."Imprest Requisition DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Requisition DMS Link field.';
                }
                field("Imprest Surrender DMS Link"; Rec."Imprest Surrender DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Surrender DMS Link field.';
                }
                field("Payment Voucher DMS Link"; Rec."Payment Voucher DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Voucher DMS Link field.';
                }
                field("Petty Cash Voucher DMS Link"; Rec."Petty Cash Voucher DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Voucher DMS Link field.';
                }
                field("Petty Cash Surrender DMS Link"; Rec."Petty Cash Surrender DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Surrender DMS Link field.';
                }
                field("Inter Bank Transfer DMS Link"; Rec."Inter Bank Transfer DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inter Bank Transfer DMS Link field.';
                }
                field("Receipts DMS Link"; Rec."Receipts DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipts DMS Link field.';
                }
                field("Inter Fund Transfers DMS Link"; Rec."Inter Fund Transfers DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inter Fund Transfers DMS Link field.';
                }
                field("Direct Income Voucher DMS Link"; Rec."Direct Income Voucher DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Direct Income Voucher DMS Link field.';
                }
                field("Leave Applications DMS Link"; Rec."Leave Applications DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Applications DMS Link field.';
                }
                field("Store Requisition Links"; Rec."Store Requisition Links")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Store Requisition Links field.';
                }
                field("Purchase Requisition Link"; Rec."Purchase Requisition Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Requisition Link field.';
                }
                field("Salary Voucher DMS Link"; Rec."Salary Voucher DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Voucher DMS Link field.';
                }
                field("AIE EDMS Link"; Rec."AIE EDMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AIE EDMS Link field.';
                }
                field("Salary Advance DMS Link"; Rec."Salary Advance DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Advance DMS Link field.';
                }
                field("Car Loan DMS Link"; Rec."Car Loan DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Car Loan DMS Link field.';
                }
                field("Purchase Order DMS Link"; Rec."Purchase Order DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Order DMS Link field.';
                }
                field("Warrant Voucher Links"; Rec."Warrant Voucher Links")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Warrant Voucher Links field.';
                }
                field("Inspection DMS Link"; Rec."Inspection DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection DMS Link field.';
                }
                field("Purchase Invoice DMS Link"; Rec."Purchase Invoice DMS Link")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = URL;
                    ToolTip = 'Specifies the value of the Purchase Invoice DMS Link field.';
                }
                field("Student Cases DMS Link"; Rec."Student Cases DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Cases DMS Link field.';
                }
                field("Daily Work Ticket  DMS Link"; Rec."Daily Work Ticket  DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily Work Ticket  DMS Link field.';
                }
                field("Property Reports  DMS Link"; Rec."Property Reports  DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Property Reports  DMS Link field.';
                }
                field("Insurance Claim  DMS Link"; Rec."Insurance Claim  DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Claim  DMS Link field.';
                }
                field("Gate Pass  DMS Link"; Rec."Gate Pass  DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gate Pass  DMS Link field.';
                }
                field("Medical Claim  DMS Link"; Rec."Medical Claim  DMS Link")
                {
                    ApplicationArea = Basic;
                    Caption = 'Medical Scheme DMS Link';
                    ToolTip = 'Specifies the value of the Medical Scheme DMS Link field.';
                }
                field("Marker Claim  DMS Link"; Rec."Marker Claim  DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marker Claim  DMS Link field.';
                }
            }
            group("Deposit & Revenue")
            {
                field("Revenue Receivable Account"; Rec."Revenue Receivable Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revenue Receivable Account field.';
                }
                // field("Deposit Cash Book"; Rec."Deposit Cash Book")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Deposit Cash Book field.';
                // }
                // field("Revenue Cash Book"; Rec."Revenue Cash Book")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Revenue Cash Book field.', Comment = '%';
                // }
                field("Income Account"; Rec."Income Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Income Account field.', Comment = '%';
                }
                field("KCB Controller Email"; Rec."KCB Controller Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the KCB Controller Email field.', Comment = '%';
                }
                field("Receipt Retries"; Rec."Receipt Retries")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receipt Retries field.', Comment = '%';
                }
                field("Allow AIE Edit"; Rec."Allow AIE Edit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allow AIE Edit field.', Comment = '%';
                }
            }
            group("Document Control")
            {
                field("No of Open docs"; "No of Open docs")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the number of open documents to a specific user for utilization';
                }
                field("EFT Max Docs"; "EFT Max Docs")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the number of EFT Open documents to a specific user for utilization';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}

#pragma implicitwith restore

