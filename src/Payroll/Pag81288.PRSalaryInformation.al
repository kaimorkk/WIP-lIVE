page 52193728 "PR Salary Information"
{
    AutoSplitKey = false;
    Caption = 'Payment Information';

    DelayedInsert = true;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "PR Salary Card";

    layout
    {
        area(content)
        {
            repeater(PaymentInfo)
            {
                Caption = 'Payment Info';
                field(BasicPay; "Basic Pay")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        //Record change being made on which payroll period
                        PRPayrollPeriod.Reset;
                        PRPayrollPeriod.SetRange(PRPayrollPeriod.Closed, false);
                        if not PRPayrollPeriod.FindFirst() then Error('No Open Payroll Period found');

                        //HR Value Change
                        Clear(prEmployees);
                        if prEmployees.Get("Employee Code") then begin

                        end;
                    end;
                }
                field(PaysNSSF; "Pays NSSF")
                {
                    ApplicationArea = Basic;
                }
                field(PaysNHIF; "Pays NHIF")
                {
                    ApplicationArea = Basic;
                }
                field(PaysPAYE; "Pays PAYE")
                {
                    ApplicationArea = Basic;
                }
                field("Pays NITA"; Rec."Pays NITA")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pays NITA field.';
                }
                field("Has Fuel Card"; Rec."Has Fuel Card")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Has Fuel Card field.';
                }
                field(DeActivatePersonalRelief; "De-Activate Personal Relief?")
                {
                    ApplicationArea = Basic;
                }
                field(InsuranceCertificate; "Insurance Certificate?")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }


                field("PWD Certificate?"; "PWD Certificate?")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Has Insurance Relief"; "Has Insurance Relief")
                {
                    ApplicationArea = all;

                }
                field(SuspendPay; "Suspend Pay")
                {
                    ApplicationArea = Basic;
                }
                field(SuspensionDate; "Suspension Date")
                {
                    ApplicationArea = Basic;
                }
                field(SuspensionReasons; "Suspension Reasons")
                {
                    ApplicationArea = Basic;
                    MultiLine = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        //CALCFIELDS("Is Paid Daily?");
        ////IF "Is Paid Daily?" = FALSE THEN BPAY_Editable:=TRUE;
    end;

    trigger OnOpenPage()
    begin
        ///BPAY_Editable:=FALSE;
    end;

    var
        Qtn: label '''Leave without saving changes?''';
        // HRCodeunit: Codeunit "HR Codeunit";
        HREmp: Record "Employee";
        PRPayrollPeriod: Record "PR Payroll Periods";
        prEmployees: Record "Employee";
        PRSalaryCard: Record "PR Salary Card";
}

