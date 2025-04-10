

Page 75000 "Procurement Setup"
{
    PageType = Card;
    SourceTable = "Procurement Setup";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Default Proc Email Contact"; Rec."Default Proc Email Contact")
                {
                    ApplicationArea = Basic;
                }

                field("Default Stores Person"; Rec."Default Stores Person")
                {
                    ApplicationArea = Basic;
                }
                field("Default Procurement Plan"; Rec."Default Procurement Plan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Procurement Plan field.';
                }
                field("Default IFP Bid Charge Code"; Rec."Default IFP Bid Charge Code")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Procurement Plan"; Rec."Effective Procurement Plan")
                {
                    ApplicationArea = Basic;
                }
                field("Default Language Code"; Rec."Default Language Code")
                {
                    ApplicationArea = Basic;
                }
                field("Local Vendor Country Code"; Rec."Local Vendor Country Code")
                {
                    ApplicationArea = Basic;
                }
                field("Display Scoring Criteria"; Rec."Display Scoring Criteria")
                {
                    ApplicationArea = Basic;
                    Caption = 'Display Scoring Criteria to Vendors?';
                }
                field("Default Tender Addendum Type"; Rec."Default Tender Addendum Type")
                {
                    ApplicationArea = Basic;
                }
                field("Default PRN Conversion Proc"; Rec."Default PRN Conversion Proc")
                {
                    ApplicationArea = Basic;
                }
                field("Default IFS Bid Charge Code"; Rec."Default IFS Bid Charge Code")
                {
                    ApplicationArea = Basic;
                }
                field("Default Single Stage Tender"; Rec."Default Single Stage Tender")
                {
                    ApplicationArea = Basic;
                }
                field("Default Two Stage Tender valid"; Rec."Default Two Stage Tender valid")
                {
                    ApplicationArea = Basic;
                }
                field("Default RFQ Validity Duration"; Rec."Default RFQ Validity Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Default LVP Validity Duration"; Rec."Default LVP Validity Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Award Acceptance Deadline"; Rec."Award Acceptance Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Min. Contract Holding Duration"; Rec."Min. Contract Holding Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Appeal Review"; Rec."Procurement Appeal Review")
                {
                    ApplicationArea = Basic;
                }
                field("Enforce Strict Proc Budget che"; Rec."Enforce Strict Proc Budget che")
                {
                    ApplicationArea = Basic;
                }
                field("Back Alert on PRN Approval"; Rec."Back Alert on PRN Approval")
                {
                    ApplicationArea = Basic;
                }
                field("Back Alert on IFS Creation"; Rec."Back Alert on IFS Creation")
                {
                    ApplicationArea = Basic;
                }
                field("Default Procurement Template"; Rec."Default Procurement Template")
                {
                    ApplicationArea = Basic;
                }
                field("Default General Product PG"; Rec."Default General Product PG")
                {
                    ApplicationArea = Basic;
                }
                field("Default Vendor PG"; Rec."Default Vendor PG")
                {
                    ApplicationArea = Basic;
                }
                field("Default Tender Evaluation Peri"; Rec."Default Tender Evaluation Peri")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Number Series")
            {
                field("Item Creation Request Nos"; Rec."Item Creation Request Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Creation Request Nos field.';
                }
                field("Procument Plan Nos"; Rec."Procument Plan Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Dept Procument Plan Nos"; Rec."Dept Procument Plan Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Departmental Procument Plan Nos field.', Comment = '%';
                }
                field("Request For Registration Nos"; Rec."Request For Registration Nos")
                {
                    ApplicationArea = Basic;
                }
                field("IFT Nos"; Rec."IFT Nos")
                {
                    ApplicationArea = Basic;
                }
                field("IFP Nos."; Rec."IFP Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Procument Plan Revision Nos"; Rec."Procument Plan Revision Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Procument Plan Revision Voucher Nos field.';
                }

                field("Bid Req Template No. Series"; Rec."Bid Req Template No. Series")
                {
                    ApplicationArea = Basic;
                }

                field("Store Req No"; Rec."Store Req No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Store Req No field.';
                }
                field("Purchase Req No"; Rec."Purchase Req No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Req No field.';
                }
                field("Asset Disposal Nos"; Rec."Asset Disposal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset Disposal Nos field.';
                }
                field("Contract Nos"; Rec."Contract Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Nos field.';
                }
                field("Direct Prcmnt Nos"; Rec."Direct Prcmnt Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Direct Prcmnt Nos field.';
                }
                field("Disposal Invitation Nos"; Rec."Disposal Invitation Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Disposal Invitation Nos field.';
                }
                field("Disposal Plan Nos"; Rec."Disposal Plan Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Disposal Plan Nos field.';
                }
                field("Disposal Requisition Nos"; Rec."Disposal Requisition Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Disposal Requisition Nos field.';
                }
                field("Framework ITT No. Series"; Rec."Framework ITT No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Framework ITT No. Series field.';
                }
                field("Functional Disposal Plan Nos"; Rec."Functional Disposal Plan Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Functional Disposal Plan Nos field.';
                }
                field("IFR Evaluation Report Nos"; Rec."IFR Evaluation Report Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the IFR Evaluation Report Nos field.';
                }
                field("IFR Opinion Nos"; Rec."IFR Opinion Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the IFR Opinion Nos field.';
                }
                field("Request for Quotation Nos."; Rec."Request for Quotation Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request for Quotation Nos. field.';
                }
                field("Request for Proposals Nos."; Rec."Request for Proposals Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request for Proposals Nos. field.';
                }
                field("Special RFQ Prcmnt Nos"; Rec."Special RFQ Prcmnt Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Special RFQ Prcmnt Nos field.';
                }
                field("Specially Permitted Prcmnt Nos"; Rec."Specially Permitted Prcmnt Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Specially Permitted Prcmnt Nos field.';
                }
                field("PRN High Priority Lead Time"; Rec."PRN High Priority Lead Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PRN High Priority Lead Time field.';
                }
                field("PRN Low Priority Lead Time"; Rec."PRN Low Priority Lead Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PRN Low Priority Lead Time field.';
                }
                field("PRN Normal Priority Lead Time"; Rec."PRN Normal Priority Lead Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PRN Normal Priority Lead Time field.';
                }
                field("Legal Dept Code"; Rec."Legal Dept Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Legal Department Code field.';
                }
                field("Current Year"; Rec."Current Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Year field.';
                }
                field("Vendor Proffesional Opinion No"; Rec."Vendor Proffesional Opinion No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Proffesional Opinion No field.';
                }
                field("Vendor Notice of Award"; Rec."Vendor Notice of Award")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Notice of Award field.';
                }
                field("Vendor Evaluation Report Nos"; Rec."Vendor Evaluation Report Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Evaluation Report Nos field.';
                }
                field("ITT No. Series"; Rec."ITT No. Series")
                {
                    ApplicationArea = Basic;
                }

                field("EOI No. Series"; Rec."EOI No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Low Value Purchase No. Series"; Rec."Low Value Purchase No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Standing Proc Committee  No."; Rec."Standing Proc Committee  No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Debarment No. series"; Rec."Vendor Debarment No. series")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Reinstatement Nos"; Rec."Vendor Reinstatement Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Project Key Staff Temp Nos"; Rec."Project Key Staff Temp Nos")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Prebid Register"; Rec."IFS Prebid Register")
                {
                    ApplicationArea = Basic;
                    Caption = 'IFS Prebid Register Nos';
                }
                field("Supplier Appraisal Template No"; Rec."Supplier Appraisal Template No")
                {
                    ApplicationArea = Basic;
                }
                field("IFP Response Nos"; Rec."IFP Response Nos")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Tender Committee No."; Rec."IFS Tender Committee No.")
                {
                    ApplicationArea = Basic;
                }
                field("EOI Response Nos"; Rec."EOI Response Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification Score Header"; Rec."Prequalification Score Header")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Addendum Notice"; Rec."Tender Addendum Notice")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Cancellation Nos"; Rec."Tender Cancellation Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Nos"; Rec."Bid Opening Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Evalution Nos"; Rec."Bid Evalution Nos")
                {
                    ApplicationArea = all;
                }
                field("Final Evaluation Report Nos"; Rec."Final Evaluation Report Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Proffesional Opinion Nos"; Rec."Proffesional Opinion Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Notice of Award"; Rec."Notice of Award")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Security Claim Nos"; Rec."Bid Security Claim Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Security Returned Nos"; Rec."Bid Security Returned Nos")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Bid)
            {
                Caption = 'Bid';
                field("Default Bid Security %"; Rec."Default Bid Security %")
                {
                    ApplicationArea = Basic;
                }
                field("Default Performance Security %"; Rec."Default Performance Security %")
                {
                    ApplicationArea = Basic;
                }
                field("Default Advance Pay Security %"; Rec."Default Advance Pay Security %")
                {
                    ApplicationArea = Basic;
                }
                field("Special Grp Bid Waiver"; Rec."Special Grp Bid Waiver")
                {
                    ApplicationArea = Basic;
                }
                field("Special Grp Performance Waiver"; Rec."Special Grp Performance Waiver")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Validity Duration"; Rec."Tender Validity Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Security Validity(After)"; Rec."Bid Security Validity(After)")
                {
                    ApplicationArea = Basic;
                }
                field("Goods Supply Insurance Type"; Rec."Goods Supply Insurance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Works Supply Insurance Type"; Rec."Works Supply Insurance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Service Supply Insurance Type"; Rec."Service Supply Insurance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Default Arbitrator Appointer"; Rec."Default Arbitrator Appointer")
                {
                    ApplicationArea = Basic;
                }
                field("Infinite Bid Value Limit"; Rec."Infinite Bid Value Limit")
                {
                    ApplicationArea = Basic;
                }
                field("YES Bid Rating Response Value"; Rec."YES Bid Rating Response Value")
                {
                    ApplicationArea = Basic;
                }
                field("Default YES Bid Rating Score %"; Rec."Default YES Bid Rating Score %")
                {
                    ApplicationArea = Basic;
                }
                field("NO Bid Rating Response Value"; Rec."NO Bid Rating Response Value")
                {
                    ApplicationArea = Basic;
                }
                field("Default NO Bid Rating Score %"; Rec."Default NO Bid Rating Score %")
                {
                    ApplicationArea = Basic;
                }
                field("1-POOR Option Text Bid Score %"; Rec."1-POOR Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("2-FAIR Option Text Bid Score %"; Rec."2-FAIR Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("3-GOOD Option Text Bid Score %"; Rec."3-GOOD Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("4-VERY GOOD  Text Bid Score %"; Rec."4-VERY GOOD  Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("5-EXCELLENT Text Bid Score %"; Rec."5-EXCELLENT Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("No. Open Documents"; Rec."No. Open Documents")
                {
                    ApplicationArea = all;
                }
            }
            group(Notification)
            {
                Caption = 'Notification';
                field("Notify Committe Members"; Rec."Notify Committe Members")
                {
                    ApplicationArea = Basic;
                }
                field("First Notification"; Rec."First Notification")
                {
                    ApplicationArea = all;
                }
                field("Second Notification"; Rec."Second Notification")
                {
                    ApplicationArea = all;
                }
                field("Third Notification"; Rec."Third Notification")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

