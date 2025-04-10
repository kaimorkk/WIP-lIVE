

page 69286 "Hr E-Mail Parameters"
{
    PageType = List;
    SourceTable = "Hr E-Mail Parameters";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Associate With"; Rec."Associate With")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Associate With field.';
                }
                field("Sender Name"; Rec."Sender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Name field.';
                }
                field("Sender Address"; Rec."Sender Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Address field.';
                }
                field(Recipients; Rec.Recipients)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipients field.';
                }
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field(Body; Rec.Body)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Body field.';
                }
                field("Body 2"; Rec."Body 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Body 2 field.';
                }
                field(HTMLFormatted; Rec.HTMLFormatted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HTMLFormatted field.';
                }
                field("Body 3"; Rec."Body 3")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Body 3 field.';
                }
                field("Body 4"; Rec."Body 4")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Body 4 field.';
                }
                field("Body 5"; Rec."Body 5")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Body 5 field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

