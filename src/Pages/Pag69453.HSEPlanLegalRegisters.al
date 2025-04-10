

page 69453 "HSE Plan Legal Registers"
{
    CardPageID = "HSE Plan Legal Register";
    PageType = List;
    SourceTable = "HSE Plan Legal Register";

    layout
    {
        area(content)
        {
            repeater(Group)
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

