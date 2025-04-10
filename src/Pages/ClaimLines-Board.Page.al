Page 52194186 "Claim Lines-Board"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Claim Line-Comm1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(LineNo;"Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ClaimNo;"Claim No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(CommissionerCode;"Commissioner Code")
                {
                    ApplicationArea = Basic;
                }
                field(CommissionerName;"Commissioner Name")
                {
                    ApplicationArea = Basic;
                }
                field(HospitalSpecialist;"Hospital/Specialist")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(VisitDate;"Visit Date")
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
                field(AmoutSpentOutPatient;"Amout Spend (Out-Patient)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Amout Spent (Out-Patient)';
                }
                field(BalanceOutPatient;"Balance (Out-Patient)")
                {
                    ApplicationArea = Basic;
                }
                field(AmountSpentInPatient;"Amount Spend (In-Patient)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount Spent (In-Patient)';
                }
                field(BalanceInPatient;"Balance (In-Patient)")
                {
                    ApplicationArea = Basic;
                }
                field(PolicyStartDate;"Policy Start Date")
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
           "Claim Type":="claim type"::"Out-Patient";
    end;
}

