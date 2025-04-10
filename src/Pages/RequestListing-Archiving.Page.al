Page 52194220 "Request Listing-Archiving"
{
    Editable = true;
    PageType = Card;
    SourceTable = "Request Header1";
    SourceTableView = where(Archived=const(false));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Select;Select)
                {
                    ApplicationArea = Basic;
                }
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequestDate;"Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TripNo;"Trip No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Country;Country)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TripStartDate;"Trip Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TripExpectedEndDate;"Trip Expected End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoofDays;"No. of Days")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(GlobalDimension1Code;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoSeries;"No. Series")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DeadlineforImprestReturn;"Deadline for Imprest Return")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BankAccount;"Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(GlobalDimension2Code;"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TransactionType;"Transaction Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CustomerAC;"Customer A/C")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ImprestAmount;"Imprest Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Balance;Balance)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ImprestBalance;"Imprest Balance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ClaimaccountingBalance;"Claim accounting Balance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ImprestClaims)
            {
                Caption = 'Imprest/Claims';
                action(Archive)
                {
                    ApplicationArea = Basic;
                    Caption = 'Archive';

                    trigger OnAction()
                    begin
                           Pvs.Reset;
                           Pvs.SetRange(Pvs.Archived,false);
                           Pvs.SetRange(Pvs.Select,true);
                           if Pvs.Find('-') then
                           repeat
                               Pvs.Archived:=true;
                               Pvs.Modify;
                           until Pvs.Next=0;
                    end;
                }
            }
        }
    }

    var
        Pvs: Record "Request Header1";
}

