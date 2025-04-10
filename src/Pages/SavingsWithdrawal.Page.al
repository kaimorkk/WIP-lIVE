Page 52194000 "Savings Withdrawal"
{
    PageType = Card;
    SourceTable = "Savings Withdrawal1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Decription;Decription)
                {
                    ApplicationArea = Basic;
                }
                field(PayrollPeriod;"Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field(PayPeriod;"Pay Period")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin


                    AssMatrix.Init;
                    AssMatrix."Employee No":="Employee No.";
                    AssMatrix.Type:=AssMatrix.Type::Payment;
                    AssMatrix.Code:=Code;
                    AssMatrix."Payroll Period":="Payroll Period";
                    AssMatrix.Amount:=Amount;
                    AssMatrix.Description:=Decription;
                    AssMatrix."Pay Period":= "Pay Period";
                    AssMatrix."Reference No":='SVD-'+"Employee No.";
                    AssMatrix.Frequency:=AssMatrix.Frequency::"Non-recurring";

                    AssMatrix.Modify;

                    Posted:=true;
                    Modify;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Post_Promoted; Post)
                {
                }
            }
        }
    }

    var
        AssMatrix: Record "Assignment Matrix-X1";
}

