Page 52193831 "File movement"
{
    PageType = Card;
    SourceTable = "File Movement Details1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(FileMovementCode;"File Movement Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FileCode;"File Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FileIssuedate;"File Issue date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FileIssueTime;"File Issue Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DateDueatRegistry;"Date Due at Registry")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Officerissuedfile;"Officer issued file")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(OfficerName;"Officer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ActionTaken;"Action Taken")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(GlobalDimension1Code;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FolioNo;"Folio No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Moved;Moved)
                {
                    ApplicationArea = Basic;
                    Caption = 'Issued?';
                    Editable = false;
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
                    Editable = false;
                }
                field(RegistryComments;"Registry Comments")
                {
                    ApplicationArea = Basic;
                }
                field(Returned;"Returned?")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Volume;Volume)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(CompleteReturn)
            {
                ApplicationArea = Basic;
                Caption = 'Complete Return';

                trigger OnAction()
                begin
                    if "Returned?"=true then
                    Error('File has already been returned');

                    TestField("Date Returned To Registry");
                    TestField("Receiving Officer");

                    "Returned?":=true;
                    Modify;

                    FileDetails.Reset;
                    FileDetails.SetRange(FileDetails."File Code","File Code");
                    FileDetails.SetRange(FileDetails.Volume,Volume);

                    if FileDetails.Find('+')then begin
                    FileDetails.Status:=FileDetails.Status::Available;
                    FileDetails.Modify;
                    end;

                    Message('File Has been successfully returned');
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(CompleteReturn_Promoted; CompleteReturn)
                {
                }
            }
        }
    }

    var
        FileDetails: Record "File Details1";
}

