Page 52193479 "My Members"
{
    Caption = 'My Members';
    PageType = ListPart;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field(IDNo; "ID. No.")
                {
                    ApplicationArea = Basic;
                }
                field(RegistrationDate; "Registration Date")
                {
                    ApplicationArea = Basic;
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(EmployerCode; "Employer Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Gender)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Open)
            {
                ApplicationArea = Basic;
                Caption = 'Open';
                Image = Edit;
                RunPageMode = View;
                ShortCutKey = 'Return';

                trigger OnAction()
                begin
                    OpenCustomerCard;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        GetCustomer;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Clear(Cust);
    end;

    trigger OnOpenPage()
    begin
        //SETRANGE("User ID",USERID);
    end;

    var
        Cust: Record Customer;


    procedure GetCustomer()
    begin
        Clear(Cust);

        if Cust.Get("No.") then
            Cust.CalcFields(Balance);
    end;


    procedure OpenCustomerCard()
    begin
        // if Cust.Get("No.") then
        //   Page.Run(Page::"Member Card",Cust);
    end;
}

