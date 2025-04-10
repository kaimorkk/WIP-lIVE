Page 52194138 "Claim Lines"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Claim Line1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(ClaimNo;"Claim No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                    Visible = true;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(VisitDate;"Visit Date")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(PolicyStartDate;"Policy Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(Dependant;"Patient No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Dependant';
                    NotBlank = true;
                }
                field(PatientName;"Patient Name")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Relationship;Relationship)
                {
                    ApplicationArea = Basic;
                    LookupPageID = "HR Relative";
                }
                field(HospitalSpecialist;"Hospital/Specialist")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(LineNo;"Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ClaimType;"Claim Type")
                {
                    ApplicationArea = Basic;
                }
                field(InvoiceNumberReceiptNo;"Invoice Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoice Number/Receipt No';
                    NotBlank = true;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Settled;Settled)
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo;"Cheque No")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
           "Claim Type":="claim type"::"Out Patient";
    end;
}

