Page 52193767 "File Batch details"
{
    PageType = ListPart;
    SourceTable = "File Batch Requests1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(FileNo;"File No.")
                {
                    ApplicationArea = Basic;

                    trigger OnLookup(var Text: Text): Boolean
                    begin

                           FileDetails.Reset;
                            if Page.RunModal(51016,FileDetails) = Action::LookupOK then begin


                            // FileManagement.SETRANGE(FileManagement."File No.",FileDetails."File Code");
                            // FileManagement.SETRANGE(FileManagement.Volume,FileDetails.Volume);
                            // FileManagement.SETRANGE(FileManagement."File Name",FileDetails."File Description");
                            // IF FileManagement.FIND('-') THEN BEGIN
                             FileMove.Reset;
                             FileMove.SetRange(FileMove."File Code",FileDetails."File Code");
                             FileMove.SetRange(FileMove.Volume,FileDetails.Volume);
                             FileMove.SetRange(FileMove.Transfered,false);
                             FileMove.SetRange(FileMove."Returned?",false);


                             if FileMove.FindFirst then begin
                             FileHolder:=FileMove."Officer Name";
                             end;

                            if FileDetails.Status=FileDetails.Status::"Not Available" then begin
                             FileMove.Reset;
                             FileMove.SetRange(FileMove."File Code",FileDetails."File Code");
                             FileMove.SetRange(FileMove.Volume,FileDetails.Volume);
                             FileMove.SetRange(FileMove.Transfered,false);
                             FileMove.SetRange(FileMove."Returned?",false);


                             if FileMove.FindFirst then begin
                             FileHolder:=FileMove."Officer Name";
                             end;


                                   Error('%1%2','The File you have requested is not in registry!!Current Holder::',FileHolder);
                            end else begin
                            "File No.":=FileDetails."File Code";
                            Volume:=FileDetails.Volume;
                            "File Name":=FileDetails."File Description";
                            "SF No":=FileDetails."SF No.";

                            // END;

                          end;
                          end;
                    end;
                }
                field(SFNo;"SF No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Volume;Volume)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FileName;"File Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Issued;"Issued?")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    var
        FileDetails: Record "File Details1";
        FileManagement: Record "File Batch Requests1";
        FileMove: Record "File Movement Details1";
        FileHolder: Text[100];
}

