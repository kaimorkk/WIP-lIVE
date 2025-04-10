Page 52193987 "Claim Lines List"
{
    AutoSplitKey = true;
    Editable = false;
    PageType = List;
    SourceTable = "Claim Line1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(PatientNo;"Patient No")
                {
                    ApplicationArea = Basic;
                }
                field(ClaimNo;"Claim No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(PatientName;"Patient Name")
                {
                    ApplicationArea = Basic;
                }
                field(ClaimType;"Claim Type")
                {
                    ApplicationArea = Basic;
                }
                field(VisitDate;"Visit Date")
                {
                    ApplicationArea = Basic;
                }
                field(LineNo;"Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(InvoiceNumber;"Invoice Number")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(ApprovedAmount;"Approved Amount")
                {
                    ApplicationArea = Basic;
                }
                field(AmountSpendInPatient;"Amount Spend (In-Patient)")
                {
                    ApplicationArea = Basic;
                }
                field(HospitalSpecialist;"Hospital/Specialist")
                {
                    ApplicationArea = Basic;
                }
                field(AmoutSpendOutPatient;"Amout Spend (Out-Patient)")
                {
                    ApplicationArea = Basic;
                }
                field(Relationship;Relationship)
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "HR Relative";
                    LookupPageID = "HR Relative";
                }
            }
        }
    }

    actions
    {
    }
}

