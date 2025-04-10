

page 75271 "Finance Evaluation Line"
{
    PageType = ListPart;
    SourceTable = "Finance Evaluation Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Bidder No"; Rec."Bidder No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder No field.';
                }
                field("Bidder Name"; Rec."Bidder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Name field.';
                }

                field("Read-out Bid Price (A)"; Rec."Read-out Bid Price (A)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Read-out Bid Price (A) field.';
                }
                field("Market Price"; Rec."Market Price")
                {
                    ApplicationArea = all;
                }
                field("Final Evaluated Bid Price"; Rec."Final Evaluated Bid Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Evaluated Bid Price field.';
                }
                field("Evaluation Committee Remarks"; Rec."Evaluation Committee Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Committee Remarks (Financial Evaluation) field.';
                }
                field("Evaluation Committee Recomm"; Rec."Evaluation Committee Recomm")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Evaluation Committee Recomm field.';
                }
                field("Weighted Tech Score %"; Rec."Weighted Tech Score %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Weighted Tech Score % field.';
                }
                field("Tech Evaluation Ranking"; Rec."Tech Evaluation Ranking")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Tech Evaluation Ranking field.';
                }
                field("Financial Evaluation Date"; Rec."Financial Evaluation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Evaluation Date field.';
                }
                field("Financial Evaluation Ranking"; Rec."Financial Evaluation Ranking")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Evaluation Ranking field.';
                }
                field(Ranking; Rec.Ranking)
                {
                    ApplicationArea = all;
                }

                field("Weighted Financial Score %"; Rec."Weighted Financial Score %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Weighted Financial Score % field.';
                }
                field("Aggregate Weighted Score %"; Rec."Aggregate Weighted Score %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Aggregate Weighted Score % field.';
                }
                field("Arithmetic Corrections (B)"; Rec."Arithmetic Corrections (B)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Arithmetic Corrections (B) field.';
                }
                field("Corrected Bid Price"; Rec."Corrected Bid Price")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Corrected Bid Price field.';
                }

            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

