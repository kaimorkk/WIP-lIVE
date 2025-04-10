Page 52194154 "Telephone Request Lines"
{
    AutoSplitKey = true;
    Editable = true;
    PageType = ListPart;
    SourceTable = "Telephone Request Lines1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(RequestNo;"Request No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ContactNo;"Contact No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    NotBlank = false;
                }
                field(NameofFirmPerson;"Name of Firm/Person")
                {
                    ApplicationArea = Basic;
                }
                field(TelephoneNo;"Telephone No")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Reason;Reason)
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Called;Called)
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
            group(Telephone)
            {
                action(Action1000000020)
                {
                    ApplicationArea = Basic;
                    Caption = 'Telephone';
                    RunObject = Page "Telephone Request";
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        SetFilter(Called,'=%1',false);
    end;

    var
        TAPIManagement: Codeunit TAPIManagement;
}

