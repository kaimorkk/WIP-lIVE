Page 52193538 "Surrender Pending Approval"
{
    ApplicationArea = Basic;
    CardPageID = "Claim Header Finance";
    Editable = false;
    PageType = List;
    SourceTable = "Request Header1";
    SourceTableView = where(Type = const("Claim-Accounting"),
                            Status = const("Pending Approval"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(RequestDate; "Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(TripNo; "Trip No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Country; Country)
                {
                    ApplicationArea = Basic;
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(TripStartDate; "Trip Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(TripExpectedEndDate; "Trip Expected End Date")
                {
                    ApplicationArea = Basic;
                }
                field(NoofDays; "No. of Days")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(DeadlineforImprestReturn; "Deadline for Imprest Return")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(UserID; "User ID")
                {
                    ApplicationArea = Basic;
                }
                field(BankAccount; "Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionType; "Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field(CustomerAC; "Customer A/C")
                {
                    ApplicationArea = Basic;
                }
                field(ImprestAmount; "Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Balance; Balance)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        //SETRANGE("User ID",USERID);
    end;
}

