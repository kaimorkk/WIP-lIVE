table 50054 "Training Approval Committee"
{
    Caption = 'Training Approval Committee';
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
        }
        field(2; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(3; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(4; Committee; Code[20])
        {

            //TableRelation=comm
        }
        field(5; "Created by"; Code[50])
        {
            Caption = 'Created by';
        }
        field(6; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Open,Pending Approval,Approved,Rejected,Closed';
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Closed;

            trigger OnValidate()
            var
                Requests: Record "Training Requests";
                Lines: Record "Training Approval Lines";
            begin
                if Status = Status::Approved then begin
                    Lines.Reset();
                    Lines.SetRange("Document No", Rec.No);
                    if Lines.FindSet() then
                        repeat
                            if Requests.Get(Lines."Application No") then begin
                                case Lines.Verdict of
                                    Lines.Verdict::Approved:
                                        Requests.Validate(Status, Requests.Status::Approved);
                                    Lines.Verdict::Rejected:
                                        Requests.validate(Status, Requests.Status::Rejected);

                                end;
                                Requests.Modify();
                            end;
                        until Lines.Next() = 0;
                end;
            end;
        }
        field(7; "No. Series"; Code[10])
        {
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if No = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Training Committee Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Training Committee Nos.", xRec."No. Series", 0D, No, "No. Series");
        end;
        "Created By" := UserId;

    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
