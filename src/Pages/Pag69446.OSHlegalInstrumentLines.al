

page 69446 "OSH legal Instrument Lines"
{
    PageType = ListPart;
    SourceTable = "OSH legal Instrument Line";

    layout
    {
        area(content)
        {
            field("Legal Instrument ID"; Rec."Legal Instrument ID")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Legal Instrument ID field.';
            }
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Line No. field.';
            }
            field(Description; Rec.Description)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Description field.';
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

