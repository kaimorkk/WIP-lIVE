

page 56172 "ICT Board of Survey Entries"
{
    Editable = false;
    PageType = List;
    SourceTable = "ICT Inventory Status Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ICT Inventory No"; Rec."ICT Inventory No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Inventory No field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Conducted By"; Rec."Conducted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Conducted By field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

