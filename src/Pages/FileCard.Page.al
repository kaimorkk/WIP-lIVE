Page 52193783 "File Card"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "File Details1";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(FirstCategory;"First Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(SecondCategory;"Second Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ThirdCategory;"Third Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FourthCategory;"Fourth Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FileCode;"File Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FileDescription;"File Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(SFNo;"SF No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(MaxSizeRecommended;"Max Size Recommended")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CurrentSize;"Current Size")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FileStatus;"File Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Volume;Volume)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Measuretypeforsize;"Measure type for size")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Measuretype;"Measure type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
            }
            part(fileMove;"File Movement List")
            {
                SubPageLink = "File Code"=field("File Code");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Transfer)
            {
                ApplicationArea = Basic;
                Caption = 'Transfer.';

                trigger OnAction()
                begin
                    
                    if Confirm('Are you sure you want to transfer this file?',true) =true then begin
                    
                    CurrPage.fileMove.Page.GetfileMovement(fileMoveNo);
                    fileMovementRec.Reset;
                    fileMovementRec.SetRange(fileMovementRec."File Movement Code",fileMoveNo);
                    //FORM.RUN(51108,fileMovementRec);
                    if fileMovementRec.FindFirst=true then begin
                    if fileMovementRec."Returned?"=true then  begin
                    Error('This File Request cannot be transfered.It is been marked as returned!');
                    end;
                    
                    if fileMovementRec.Transfered=true then  begin
                    Error('This File Request cannot be transfered.It is been marked as Transfered!');
                    end;
                    
                     /*
                    Users.GET(USERID);
                    IF Users."Employee No."<>fileMovementRec."Officer issued file" THEN BEGIN
                    ERROR('%1%2%3','You cannot Transfer this file.','It can only be transfered by::',fileMovementRec."Officer Name");
                    //ERROR('%1%2','It can only be transfered by::',fileMovementRec."File Name");
                    END;
                    */
                    end;
                    
                    fileMovementRec1.Init;
                    fileMovementRec1."File Code":="File Code";
                    fileMovementRec1.Volume:=Volume;
                    fileMovementRec1."Prevoius Holder":=fileMoveNo;
                    fileMovementRec1.Insert(true);
                    
                    
                    //fileMovementRec.RESET;
                    //fileMovementRec.SETRANGE(fileMovementRec."File Movement Code",fileMoveNo);
                    Page.Run(51108,fileMovementRec1);
                    
                    end;

                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Transfer_Promoted; Transfer)
                {
                }
            }
        }
    }

    var
        fileMoveNo: Code[20];
        fileMovementRec: Record "File Movement Details1";
        Users: Record "User Setup";
        Emp: Record Employee;
        fileMovementRec1: Record "File Movement Details1";
}

