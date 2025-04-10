Page 52193775 "Document Management"
{
    PageType = Card;
    SourceTable = "Document Management1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(File;File)
                {
                    ApplicationArea = Basic;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                          if Page.RunModal(51016,FileDetails) = Action::LookupOK then begin
                            File:=FileDetails."File Code";
                            Volume:=FileDetails.Volume;

                            FileManagement.SetRange(FileManagement.File,FileDetails."File Code");
                            FileManagement.SetRange(FileManagement.Volume,FileDetails.Volume);
                              if FileManagement.Find('+') then begin
                                "Folio No.":=IncStr(FileManagement."Folio No.");
                              end else
                               "Folio No.":='001';
                          end;
                    end;
                }
                field(FolioNo;"Folio No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                    TableRelation = "Document Types1"."Document Code";
                }
                field(DateFiled;"Date Received")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Filed';
                    Editable = true;
                }
                field(TimeFiled;"Time Received")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time Filed';
                    Editable = true;
                }
                field(AvailableInRegistry;"Available In Registry?")
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
            part(fileMove;"Mail/Document Move List")
            {
                SubPageLink = Document=field("Folio No."),
                              File=field(File),
                              Volume=field(Volume);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Issue)
            {
                ApplicationArea = Basic;
                Caption = 'Issue';
                Image = ReleaseDoc;

                trigger OnAction()
                begin
                    if "Available In Registry?"=false then

                    Error('This Document is Not Available In Registry.Please Confirm!!');

                    MailMove.Reset;
                    MailMove.SetRange(MailMove.Document,"Folio No.");
                    MailMove.SetRange(MailMove.File,File);
                    MailMove.SetRange(MailMove.Volume,Volume);
                    Page.Run(51511117,MailMove);
                end;
            }
            action(Receive)
            {
                ApplicationArea = Basic;
                Caption = 'Receive ';

                trigger OnAction()
                begin
                    CurrPage.fileMove.Page.GetfileMovement(fileMoveNo);
                    fileMovementRec.Reset;
                    fileMovementRec.SetRange(fileMovementRec."Movement Code",fileMoveNo);
                    Page.Run(51511120,fileMovementRec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Issue_Promoted; Issue)
                {
                }
                actionref(Receive_Promoted; Receive)
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
         "Available In Registry?":=true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Available In Registry?":=true;
    end;

    var
        FileManagement: Record "Document Management1";
        FileDetails: Record "File Details1";
        MailMove: Record "Mail/Document Movement1";
        fileMoveNo: Code[20];
        fileMovementRec: Record "Mail/Document Movement1";
}

