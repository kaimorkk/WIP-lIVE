page 69857 "Employee Airtime Allocation"
{
    Caption = 'Employee Airtime Allocation';
    PageType = List;
    SourceTable = "Employee Airtime Allocation";

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
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Airtime Amount"; Rec."Airtime Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Airtime field.';
                }
            }
        }
    }
}
