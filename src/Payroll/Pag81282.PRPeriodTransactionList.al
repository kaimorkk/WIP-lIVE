page 52193725 "PR Period Transaction List"
{
    PageType = List;
    SourceTable = "PR Period Transactions";
    //Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group1)
            {
                Editable = CanEdit;
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = All;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = All;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = All;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                }

                field("Period Closed"; "Period Closed")
                {
                    ApplicationArea = all;
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = All;
                }


                field("Old Staff No"; "Old Staff No")
                {
                    ApplicationArea = all;
                }

                field("Previous Payment System"; "Previous Payment System")
                {
                    ApplicationArea = all;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("A/C Number"; Rec."A/C Number")
                {
                    ApplicationArea = All;
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = All;
                }
                field("Period Filter"; Rec."Period Filter")
                {
                    ApplicationArea = All;
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = All;
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Post As"; Rec."Post As")
                {
                    ApplicationArea = All;
                }
                field("Original Amount"; Rec."Original Amount")
                {
                    ApplicationArea = All;
                }
                field("Journal Account Type"; Rec."Journal Account Type")
                {
                    ApplicationArea = All;
                }
                field("Journal Account Code"; Rec."Journal Account Code")
                {
                    ApplicationArea = All;
                }
                field("Group Text"; Rec."Group Text")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("GL Account"; Rec."GL Account")
                {
                    ApplicationArea = All;
                }
                field("Employee Type"; Rec."Employee Type")
                {
                    ApplicationArea = All;
                }
                field("Branch Details"; Rec."Branch Details")
                {
                    ApplicationArea = All;
                }
                field("Branch Code"; Rec."Branch Code")
                {
                    ApplicationArea = All;
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = All;
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                }
                field("Group Order"; Rec."Group Order")
                {
                    ApplicationArea = All;
                }
                field("Payslip Order"; Rec."Payslip Order")
                {
                    ApplicationArea = All;
                }


            }
        }
    }
    trigger OnOpenPage()
    begin
        PayrollRights.Reset();
        PayrollRights.SetRange(PayrollRights."User ID", UserId);
        if PayrollRights.Find('-') then
            CanEdit := PayrollRights."Can Edit Transactions";
    end;

    var
        PayrollRights: Record "PR Payroll Access Rights";
        CanEdit: Boolean;
}