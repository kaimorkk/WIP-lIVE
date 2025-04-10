

page 75282 "Notice of Award Lines"
{
    PageType = ListPart;
    SourceTable = "Bid Tabulation Line";
    //"Evaluation Committee Recomm"
    SourceTableView = where("Evaluation Committee Recomm" = filter(<>Awarded));

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
                field("Pre-bid Register No."; Rec."Pre-bid Register No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pre-bid Register No. field.';
                }
                field("Attended Pre-bid Conference"; Rec."Attended Pre-bid Conference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attended Pre-bid Conference field.';
                }
                field("Prebid Conference Date"; Rec."Prebid Conference Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prebid Conference Date field.';
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
                field("Late Bid (Opening Stage)"; Rec."Late Bid (Opening Stage)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Late Bid (Opening Stage) field.';
                }
                field("Withdrawn Bid (Opening Stage)"; Rec."Withdrawn Bid (Opening Stage)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withdrawn Bid (Opening Stage) field.';
                }
                field("Withdrawal Notice No"; Rec."Withdrawal Notice No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withdrawal Notice No field.';
                }
                field("Succesful Bid (Opening Stage)"; Rec."Succesful Bid (Opening Stage)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Succesful Bid (Opening Stage) field.';
                }
                field("Preliminary Evaluation Date"; Rec."Preliminary Evaluation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preliminary Evaluation Date field.';
                }
                field("Responsive Bid"; Rec."Responsive Bid")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsive Bid (Preliminary Evaluation) field.';
                }
                field("Technical Evaluation Date"; Rec."Technical Evaluation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Technical Evaluation Date field.';
                }
                field("Weighted Tech Score %"; Rec."Weighted Tech Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weighted Tech Score % field.';
                }
                field("Passed Tech Evaluation"; Rec."Passed Tech Evaluation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passed Tech Evaluation field.';
                }
                field("Tech Evaluation Ranking"; Rec."Tech Evaluation Ranking")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tech Evaluation Ranking field.';
                }
                field("Final Evaluated Bid Price"; Rec."Final Evaluated Bid Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Evaluated Bid Price field.';
                }
                field("Financial Evaluation Date"; Rec."Financial Evaluation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Evaluation Date field.';
                }
                field("Weighted Financial Score %"; Rec."Weighted Financial Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weighted Financial Score % field.';
                }
                field("Financial Evaluation Ranking"; Rec."Financial Evaluation Ranking")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Evaluation Ranking field.';
                }
                field("Aggregate Weighted Score %"; Rec."Aggregate Weighted Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Aggregate Weighted Score % field.';
                }
                field("Aggregate Ranking"; Rec."Aggregate Ranking")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Aggregate Ranking field.';
                }
                field("Due Dilgence Date"; Rec."Due Dilgence Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Dilgence Date field.';
                }
                field("Corrected Bid Price (C=A+B)"; Rec."Corrected Bid Price (C=A+B)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corrected Bid Price (C=A+B) field.';
                }
                field("Due Diligence Rating"; Rec."Due Diligence Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Diligence Rating field.';
                }
                field("Unconditional Disc Amount (E)"; Rec."Unconditional Disc Amount (E)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unconditional Discount Amount (E) field.';
                }
                field("Corrected & Disc Bid Price"; Rec."Corrected & Disc Bid Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corrected & Discounted Bid Price (F=C-E) field.';
                }
                field("Any Additional Adjustments (G)"; Rec."Any Additional Adjustments (G)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Any Additional Adjustments (G) field.';
                }
                field("Any Priced Deviations (H))"; Rec."Any Priced Deviations (H))")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Any Priced Deviations (H)) field.';
                }
                field("Financial Evaluation Comm Rem"; Rec."Financial Evaluation Comm Rem")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Committee Remarks (Financial Evaluation) field.';
                }
                field("Evaluation Committee Recomm"; Rec."Evaluation Committee Recomm")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Committee Recomm field.';
                }
                field("Read-out Bid Price (A)"; Rec."Read-out Bid Price (A)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Read-out Bid Price (A) field.';
                }
                field("Arithmetic Corrections (B)"; Rec."Arithmetic Corrections (B)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Arithmetic Corrections (B) field.';
                }
                field("Bid Opening Result"; Rec."Bid Opening Result")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Result field.';
                }
                field("Bid Opening Committee Remarks"; Rec."Bid Opening Committee Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Committee Remarks field.';
                }
                field("Preliminary Evaluation Reg"; Rec."Preliminary Evaluation Reg")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preliminary Evaluation Register No. field.';
                }
                field("Preliminary Evaluation Outcome"; Rec."Preliminary Evaluation Outcome")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preliminary Evaluation Outcome field.';
                }
                field("Preminary Evaluation Committee"; Rec."Preminary Evaluation Committee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Committee Remarks (Preminary Evaluation) field.';
                }
                field("Bid Opening Finance Register"; Rec."Bid Opening Finance Register")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Register No.  (Financial) field.';
                }
                field("Bid Opening Date (Financial)"; Rec."Bid Opening Date (Financial)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Date (Financial) field.';
                }
                field("Financial Eval Register No"; Rec."Financial Eval Register No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Evaluation Register No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

