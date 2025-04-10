

page 59055 "Grant Applicants subform"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Internal Grants Application";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("PI No"; Rec."PI No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI No field.';
                }
                field("PI Name"; Rec."PI Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI Name field.';
                }
                field("Amount Applied"; Rec."Amount Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Applied field.';
                }
                field("Application Send"; Rec."Application Send")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Send field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

