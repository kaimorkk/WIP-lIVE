page 50327 "Employee Requsition Lines"
{
    Caption = 'Employee Requsition Lines';
    PageType = ListPart;
    SourceTable = "Employee Transfer Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Requisition No."; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requisition No. field.';
                    Visible = false;
                }

                field("Job Grade"; Rec."Job Grade")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Grade field.';
                }
                field("No of Employee Requested"; Rec."No of Employee Requested")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Grade field.';
                }


            }
        }
    }
}
