

page 95040 "RMP Line Risk Ownership"
{
    PageType = Card;
    SourceTable = "RMP Line Risk Ownership";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center ID"; Rec."Responsibility Center ID")
                {
                    ApplicationArea = Basic;
                }
                field(Desciption; Rec.Desciption)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

