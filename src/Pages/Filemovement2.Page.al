Page 52193832 "File movement2"
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
                field(File;"File Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'File';
                    Editable = false;
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
                    Editable = false;
                }
                field(GlobalDimension1Code;"Global Dimension 1 Code")
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
            action(CompleteMovement)
            {
                ApplicationArea = Basic;
                Caption = 'Complete Movement';

                trigger OnAction()
                begin
                     TestField("File Issue date");
                     TestField("File Issue Time");
                      //TESTFIELD("Date Due at Registry");
                       TestField("Officer issued file");
                        TestField("Global Dimension 1 Code");
                    
                    
                    //Transfered:=TRUE;
                    //MODIFY;
                    /*
                    filebatch.GET("Request No","File Code");
                    filebatch."Issued?":=TRUE;
                    filebatch.MODIFY;
                    */
                    FileDetails.Reset;
                    //MESSAGE('%1',"File No.");
                    //MESSAGE('%1',Volume);
                    FileDetails.SetRange(FileDetails."File Code","File Code");
                    FileDetails.SetRange(FileDetails.Volume,Volume);
                    
                    if FileDetails.Find('+') then begin
                    FileDetails.Status:=FileDetails.Status::"Not Available";
                    FileDetails.Modify;
                    end;
                    
                    
                    FileMove.Reset;
                    FileMove.SetRange(FileMove."File Movement Code","Prevoius Holder");
                    if FileMove.FindFirst then begin
                    FileMove.Transfered:=true;
                    FileMove.Modify;
                    end;
                    
                    
                    Message('File Transfered Successfully!!');
                    exit;

                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(CompleteMovement_Promoted; CompleteMovement)
                {
                }
            }
        }
    }

    var
        filebatch: Record "File Batch Requests1";
        FileDetails: Record "File Details1";
        FileMove: Record "File Movement Details1";
}

