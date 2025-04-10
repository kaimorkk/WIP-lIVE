Page 52193786 "File Movement List"
{
    CardPageID = "File Movement Card";
    Editable = false;
    PageType = ListPart;
    SourceTable = "File Movement Details1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(FileMovementCode;"File Movement Code")
                {
                    ApplicationArea = Basic;
                }
                field(RequestNo;"Request No")
                {
                    ApplicationArea = Basic;
                }
                field(FileCode;"File Code")
                {
                    ApplicationArea = Basic;
                }
                field(Volume;Volume)
                {
                    ApplicationArea = Basic;
                }
                field(FileIssuedate;"File Issue date")
                {
                    ApplicationArea = Basic;
                }
                field(FileIssueTime;"File Issue Time")
                {
                    ApplicationArea = Basic;
                }
                field(DateDueatRegistry;"Date Due at Registry")
                {
                    ApplicationArea = Basic;
                }
                field(Officerissuedfile;"Officer issued file")
                {
                    ApplicationArea = Basic;
                }
                field(OfficerName;"Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field(ActionToBeTaken;"Action Taken")
                {
                    ApplicationArea = Basic;
                    Caption = 'Action To Be Taken';
                }
                field(Transfered;Transfered)
                {
                    ApplicationArea = Basic;
                }
                field(DateReturnedToRegistry;"Date Returned To Registry")
                {
                    ApplicationArea = Basic;
                }
                field(ReceivingOfficer;"Receiving Officer")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiverName;"Receiver Name")
                {
                    ApplicationArea = Basic;
                }
                field(FolioNo;"Folio No.")
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
            }
        }
    }

    actions
    {
    }

    var
        Users: Record "User Setup";
        Emp: Record Employee;


    procedure GetfileMovement(var fieMovement: Code[20])
    var
        fileMovementRec: Record "File Movement Details1";
    begin
        fieMovement:=Rec."File Movement Code";
    end;
}

