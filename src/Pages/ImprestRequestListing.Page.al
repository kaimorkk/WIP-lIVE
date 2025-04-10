Page 52193919 "Imprest Request Listing"
{
    ApplicationArea = Basic;
    CardPageID = "Imprest Header";
    Editable = false;
    PageType = List;
    SourceTable = "Request Header1";
    // SourceTableView = where(Type=const(Imprest));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(RequestDate;"Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Purpose of Imprest"; "Purpose of Imprest")
                {
                    ApplicationArea = Basic;
                }
                field(DeadlineforImprestReturn;"Deadline for Imprest Return")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                }
                field(BankAccount;"Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code;"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionType;"Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field(CustomerAC;"Customer A/C")
                {
                    ApplicationArea = Basic;
                }
                field(ImprestAmount;"Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Balance;Balance)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field(Surrendered; Surrendered)
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
        // SetRange("User ID",UserId);
    end;
}

