Page 52194252 "Procurement Plan Approved"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "G/L Budget Name";
    SourceTableView = where(Status=const("Pending Approval"));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = true;
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(DepartmentFilter;"Department Filter")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000008;"Procurement Plan Items")
            {
                SubPageLink = "Plan Year"=field(Name),
                              "Department Code"=field("Department Filter");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ProcurementPlan)
            {
                Caption = 'Procurement Plan';
                action(RequestforApproval)
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Approval';

                    trigger OnAction()
                    begin
                           SendForApproval() ;
                    end;
                }
            }
        }
    }

    var
        Approval: Record "G/L Budget Name";


    procedure SendForApproval()
    begin

        if Rec.Status=Rec.Status::New then
            begin
                Approval.Reset;
                //Approval.SETRANGE(Approval."No.",Rec."No.");
                Rec.Status:=Rec.Status::"Pending Approval";
               // Rec."Document Type":=Rec."Document Type"::"Approval Form";
               // "Prepared By":=DATABASE.USERID;
              //"Procurement Plan"."Department Code":="G/L Budget Name"."Department Filter" ;
                Rec.Modify;
            Message('Document Successfully sent for Approval');

            end;
    end;
}

