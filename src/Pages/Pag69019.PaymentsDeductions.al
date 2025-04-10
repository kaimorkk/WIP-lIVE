

page 69019 "Payments_Deductions"
{
    Editable = false;
    PageType = List;
    SourceTable = "Assignment Matrix-X";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field("Employer Amount"; Rec."Employer Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employer Amount field.';
                }
                field("Gratuity Amount"; Rec."Gratuity Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gratuity Amount field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Basic Salary Code"; Rec."Basic Salary Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Salary Code field.';
                }
                field("Profit Centre"; Rec."Profit Centre")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Profit Centre field.';
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch field.';
                }
                field("Pay Point"; Rec."Pay Point")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Point field.';
                }
                field("Staffing Group"; Rec."Staffing Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staffing Group field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

