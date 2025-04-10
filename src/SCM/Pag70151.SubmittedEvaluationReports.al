page 70151 "Submitted Evaluation Reports"
{
    Caption = 'Submitted Evaluation Reports';

    CardPageID = "Final Evaluation Report Card";
    Editable = false;
    PageType = List;
    SourceTable = "Bid Tabulation Header";
    SourceTableView = where("Document Type" = const("Evaluation Report"), "document status" = const(Submitted));
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Award Type"; Rec."Award Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Award Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Final Evaluation Report ID"; Rec."Final Evaluation Report ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Evaluation Report ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Name field.';
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Tender Committee Role"; Rec."Tender Committee Role")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Committee Role field.';
                }
                field("Designation/Title"; Rec."Designation/Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation/Title field.';
                }
                field("Annual Procurement Plan ID"; Rec."Annual Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Procurement Plan ID field.';
                }
                field("Procurement Plan Date"; Rec."Procurement Plan Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan Date field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
                field("Procurement Plan Line No."; Rec."Procurement Plan Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan Line No. field.';
                }
                field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan Entry No field.';
                }
                field("Available Procurement Budget"; Rec."Available Procurement Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Available Procurement Budget field.';
                }
                field("Budget Narration"; Rec."Budget Narration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Narration field.';
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Date field.';
                }
                field("Evaluation Completion Date"; Rec."Evaluation Completion Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Completion Date field.';
                }
                field("Appointed Bid Opening Comm"; Rec."Appointed Bid Opening Comm")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointed Bid Opening Comm field.';
                }
                field("Appointed Bid Evaluation Com"; Rec."Appointed Bid Evaluation Com")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointed Bid Evaluation Com field.';
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Region field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Professional Opinion ID"; Rec."Professional Opinion ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Professional Opinion ID field.';
                }
                field("Awarded Bid No"; Rec."Awarded Bid No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Bid No field.';
                }
                field("Awarded Bidder No."; Rec."Awarded Bidder No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Bidder No. field.';
                }
                field("Awarded Bidder Name"; Rec."Awarded Bidder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Bidder Name field.';
                }
                field("Award Tender Sum Inc Taxes"; Rec."Award Tender Sum Inc Taxes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Tender Sum Inc Taxes field.';
                }
                field("Award Acceptance Deadline"; Rec."Award Acceptance Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Acceptance Deadline Duration field.';
                }
                field("Award Acceptance Response"; Rec."Award Acceptance Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Acceptance Response Deadline field.';
                }
                field("Min. Contract Holding"; Rec."Min. Contract Holding")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min. Contract Holding/Standstill Duration field.';
                }
                field("Earliest Contract Issuance Dt"; Rec."Earliest Contract Issuance Dt")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Earliest Contract Issuance Dt field.';
                }
                field("Bidder NoA Response Type"; Rec."Bidder NoA Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder NoA Response Type field.';
                }
                field("Bidder NoA Response Date"; Rec."Bidder NoA Response Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder NoA Response Date field.';
                }
                field("No. of Post-Award Disputes"; Rec."No. of Post-Award Disputes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Post-Award Disputes field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

