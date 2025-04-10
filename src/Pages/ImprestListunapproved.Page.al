Page 50116 "Imprest List unapproved"
{
    CardPageID = "Imprest Header";
    Editable = false;
    PageType = List;
    SourceTable = "Request Header1";
    SourceTableView = where(Type=const(Imprest),
                            Status=filter(<>Released),
                            Archived=const(false));

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
                field(TripNo;"Trip No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Country;Country)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(TripStartDate;"Trip Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(TripExpectedEndDate;"Trip Expected End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(NoofDays;"No. of Days")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(GlobalDimension1Code;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code;"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries;"No. Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                    Visible = false;
                }
                field(TransactionType;"Transaction Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Archive)
            {
                ApplicationArea = Basic;
                Image = Agreement;

                trigger OnAction()
                begin
                    Archived:=true;
                    Modify;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        SetRange("User ID",UserId);
    end;
}

