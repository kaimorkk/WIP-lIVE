

page 56129 "ICT Projects"
{
    CardPageID = "ICT Project Card";
    Editable = false;
    PageType = List;
    SourceTable = "ICT Project";
    UsageCategory = Tasks;
    ApplicationArea = All;

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
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Primary Purchase Contract ID"; Rec."Primary Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Purchase Contract ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Internal PM"; Rec."Internal PM")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal PM field.';
                }
                field("Contracting Project Manager"; Rec."Contracting Project Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contracting Project Manager field.';
                }
                field("Client PM Phone No"; Rec."Client PM Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Client PM Phone No field.';
                }
                field("Client PM email Address"; Rec."Client PM email Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Client PM email Address field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Links)
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

