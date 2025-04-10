

page 69454 "HSE Plan Legal Register"
{
    PageType = Card;
    SourceTable = "HSE Plan Legal Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan ID field.';
                }
                field("Legal Instrument ID"; Rec."Legal Instrument ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Legal Instrument ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Instrument Type"; Rec."Instrument Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Instrument Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

