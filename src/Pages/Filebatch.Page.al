Page 52193762 "File batch"
{
    PageType = Card;
    SourceTable = "File Batch Requests1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field(RequestNo;"Request No")
                {
                    ApplicationArea = Basic;
                }
                field(FileNo;"File No.")
                {
                    ApplicationArea = Basic;
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
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(IssueFile)
            {
                ApplicationArea = Basic;
                Caption = 'Issue File';
                RunPageOnRec = false;

                trigger OnAction()
                begin

                    if "Issued?"=true then
                    Error('You Have already issued this file');

                    FileDetails.Reset;
                    //MESSAGE('%1',"File No.");
                    //MESSAGE('%1',Volume);
                    FileDetails.SetRange(FileDetails."File Code","File No.");
                    FileDetails.SetRange(FileDetails.Volume,Volume);


                    if FileDetails.Find('+') then begin

                    //REPEAT
                    //MESSAGE('%1',FileDetails.Status);
                    if FileDetails.Status=FileDetails.Status::"Not Available" then begin
                    Error('This File is not Available in Registry');

                    end else begin
                     //MESSAGE('%1',Volume);
                    fileMove.Reset;
                    fileMove.SetRange(fileMove."Request No","Request No");
                    fileMove.SetRange(fileMove."File Code","File No.");
                    fileMove.SetRange(fileMove.Volume,Volume);
                    Page.Run(51511103,fileMove);

                    end;
                    // UNTIL FileDetails.NEXT=0;
                      end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(IssueFile_Promoted; IssueFile)
                {
                }
            }
        }
    }

    var
        FileDetails: Record "File Details1";
        fileMove: Record "File Movement Details1";
}

