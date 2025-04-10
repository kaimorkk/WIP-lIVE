Page 52193833 "File Returns"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "File Details1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(FileCode;"File Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(SFNo;"SF No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FileDescription;"File Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(MaxSizeRecommended;"Max Size Recommended")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Measuretypeforsize;"Measure type for size")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CurrentSize;"Current Size")
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
                field(FileStatus;"File Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
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
                field(Volume;Volume)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RetentionPeriodYrs;"Retention Period(Yrs)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DateClosed;"Date Closed")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DisposalAction;"Disposal Action")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DisposalDate;"Disposal Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
            action(ReceiveFile)
            {
                ApplicationArea = Basic;
                Caption = 'Receive File';

                trigger OnAction()
                begin
                    CurrPage.fileMove.Page.GetfileMovement(fileMoveNo);
                    fileMovementRec.Reset;
                    fileMovementRec.SetRange(fileMovementRec."File Movement Code",fileMoveNo);
                    Page.Run(51511102,fileMovementRec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(ReceiveFile_Promoted; ReceiveFile)
                {
                }
            }
        }
    }

    var
        fileMoveNo: Code[20];
        fileMovementRec: Record "File Movement Details1";
}

