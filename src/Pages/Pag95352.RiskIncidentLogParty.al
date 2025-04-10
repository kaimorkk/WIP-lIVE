

page 95352 "Risk Incident Log Party"
{
    PageType = Card;
    SourceTable = "Risk Incident Log Party";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Incident ID"; Rec."Incident ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Party Type"; Rec."Incident Party Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Additional Details"; Rec."Additional Details")
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

