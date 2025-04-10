

page 59011 "Fleet Driver Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Vehicle Drivers";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Job Title code"; Rec."Job Title code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Title code field.';
                }
                field("Job Title Description"; Rec."Job Title Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Title Description field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Center/Department"; Rec."Center/Department")
                {
                    ApplicationArea = Basic;
                    Caption = 'Duty Station';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Center/Department field.';
                }
                field("Duty Station Name"; Rec."Duty Station Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duty Station Name field.';
                }
                field("Job Grade"; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Employement Date"; Rec."Employement Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employement Date field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Phone Number field.';
                }
                field("Driver License Number"; Rec."Driver License Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver License Number field.';
                }
                field("Type Of Driver"; Rec."Type Of Driver")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type Of Driver field.';
                }

                /* field("Licence Type"; Rec."Licence Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Licence Class';
                    ToolTip = 'Specifies the value of the Licence Class field.';
                } */
                field("Last License Renewal"; Rec."Last License Renewal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last License Renewal field.';
                }
                field("Renewal Interval Value"; Rec."Renewal Interval Value")
                {
                    ApplicationArea = Basic;
                    Caption = 'Renewal Interval(Years)';
                    ToolTip = 'Specifies the value of the Renewal Interval(Years) field.';
                }
                field("Next License Renewal"; Rec."Next License Renewal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next License Renewal field.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Active field.';
                }


            }
            part("Vehicle Driver Line"; "Vehicle Driver Line")
            {
                Caption = 'Licence Types';
                SubPageLink = "Driver Code" = field(Driver), "Driver Name" = field("Driver Name");
                ApplicationArea = All;
            }
        }
    }
}

#pragma implicitwith restore

