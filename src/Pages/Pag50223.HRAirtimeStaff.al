page 50223 "HR Airtime Staff"
{
    Caption = 'HR Airtime Staff';
    PageType = ListPart;
    SourceTable = "HR Airtime Staff";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Airtime; Rec.Airtime)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Airtime field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Service Provider No"; Rec."Service Provider No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Provider No field.';
                }
                field("Service Provider Name"; Rec."Service Provider Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Provider Name field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }



            }
        }
    }
}
