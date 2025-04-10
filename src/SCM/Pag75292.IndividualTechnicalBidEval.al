

page 75292 "Individual Technical Bid Eval"
{
    CardPageID = "Individual Technical Bid Evalu";
    Editable = false;
    PageType = List;
    SourceTable = "Bid Evaluation Register";
    SourceTableView = where("Evaluation Type" = filter("Technical Evaluation"),
                            "Evaluator Category" = const("Individual Evaluator"));
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
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Type field.';
                }
                field("Evaluator Category"; Rec."Evaluator Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluator Category field.';
                }
                field("Evaluation Lead"; Rec."Evaluation Lead")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Lead field.';
                }
                field("Evaluation Lead Name"; Rec."Evaluation Lead Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Lead Name field.';
                }
                field("Bid No."; Rec."Bid No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Bidder Name"; Rec."Bidder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Evaluation Date"; Rec."Evaluation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Date field.';
                }
                field("Evaluation Venue"; Rec."Evaluation Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Venue field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Bid Scoring Document No."; Rec."Bid Scoring Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Scoring Document No. field.';
                }
                field("Bid Scoring Document Type"; Rec."Bid Scoring Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Scoring Document Type field.';
                }
                field("Bid Opening Register No."; Rec."Bid Opening Register No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Register No. field.';
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Date field.';
                }
                field("Tender Evaluation Deadline"; Rec."Tender Evaluation Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Evaluation Deadline field.';
                }
                field("Appointed Bid Evaluation Commi"; Rec."Appointed Bid Evaluation Commi")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointed Bid Evaluation Commi field.';
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Region field.';
                }
                field("Bid Envelop Type"; Rec."Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Envelop Type field.';
                }
                field("Final Opening Done"; Rec."Final Opening Done")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Opening Done field.';
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchaser Code field.';
                }
                field("Preliminary Evaluation Score"; Rec."Preliminary Evaluation Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preliminary Evaluation Score field.';
                }
                field("Weighted Technical Eval Score"; Rec."Weighted Technical Eval Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weighted Technical Eval Score field.';
                }
                field("Technical Evaluation  Decision"; Rec."Technical Evaluation  Decision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Technical Evaluation  Decision field.';
                }
                field("Weighted Financial Eval Score"; Rec."Weighted Financial Eval Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weighted Financial Eval Score field.';
                }
                field("Award Decision"; Rec."Award Decision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Decision field.';
                }
                field("Tender Evaluation Comm Remarks"; Rec."Tender Evaluation Comm Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Evaluation Comm Remarks field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

