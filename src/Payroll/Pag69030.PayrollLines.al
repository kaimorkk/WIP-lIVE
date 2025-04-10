

page 52193743 "Payroll Lines"
{
    PageType = List;
    SourceTable = "Payroll Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Personal No."; Rec."Personal No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Personal No. field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Basic Salary field.';
                }
                field("Basic Arrears"; Rec."Basic Arrears")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Basic Arrears field.';
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Gross Pay field.';
                }
                field("Total Deduction"; Rec."Total Deduction")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Deduction field.';
                }
                field(Netpay; Rec.Netpay)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Netpay field.';
                }
                field("Payroll Header"; Rec."Payroll Header")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Payroll Header field.';
                }
                field("Payroll Group"; Rec."Payroll Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Payroll Group field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(VPayslip)
            {
                Caption = 'Email payslip';
                Scope = Repeater;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Employee, Employee2 : Record Employee;
                    Email: Codeunit Email;
                    EmailMessage: Codeunit "Email Message";
                    InStr, InStr2 : Instream;
                    TempBlob: Codeunit "Temp Blob";
                    Body: Text;
                    Subject: Text[100];
                    RecRef: RecordRef;
                    Recipients: List of [Text];
                    OutStr, OutStr2 : OutStream;
                    Filename: Text;
                    Parameters: Text;
                    PayPeriod: Record "PR Payroll Periods";
                    Payslip: Report "PR Individual Payslip";
                    PRSalARYCard: Record "PR Salary Card";
                    PRPeriod: Record "PR Payroll Periods";
                    SelectedPeriod: Date;
                    Text001: Label 'Do you want to email Employee %1 their %2 payslip?';
                begin
                    if not Confirm(StrSubstNo(Text001, Rec."Personal No.", Rec."Payroll Period")) then
                        exit;
                    PRPeriod.Reset;
                    PRPeriod.Get(Rec."Payroll Period");
                    SelectedPeriod := PRPeriod."Date Opened";

                    Clear(Recipients);
                    Clear(RecRef);
                    Clear(InStr);
                    Clear(OutStr);
                    Employee.Get(Rec."Personal No.");
                    if Employee."Company E-Mail" <> '' then begin
                        Recipients.Add(Employee."Company E-Mail");
                        Subject := PayPeriod."Period Name" + 'Payslip';
                        Body := 'Dear ' + Employee."First Name" + ', <br>Please find attached your payslip for the period ' + PayPeriod."Period Name";
                        EmailMessage.Create(Recipients, Subject, Body, true);
                        Filename := Employee."No." + '_' + PayPeriod."Period Name" + '.pdf';
                        PRSalARYCard.SetRange("Employee Code", Rec."Personal No.");
                        PRSalARYCard.SetRange(PRSalARYCard."Period Filter", SelectedPeriod);
                        RecRef.GetTable(PRSalARYCard);
                        TempBlob.CreateOutStream(OutStr);
                        Report.SaveAs(Report::"PR Individual Payslip", '', ReportFormat::Pdf, OutStr, RecRef);
                        TempBlob.CreateInStream(InStr);
                        EmailMessage.AddAttachment(Filename, 'PDF', InStr);

                        Email.Send(EmailMessage);
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(VPayslip_Promoted; VPayslip)
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

