

page 80158 "Committees1"
{
    CardPageID = "SPE Commitee Creation";
    Editable = false;
    PageType = List;
    SourceTable = "SPE Commitee Appointment";


    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Appointment No"; Rec."Appointment No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment No field.';
                }
                field("Committee ID"; Rec."Committee ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee ID field.';
                }
                field("Committee Name"; Rec."Committee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Name field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
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

