function LineObjects = import_line_data()
%Ones this function is called the data are imported from Branches excel
%file. In this simulation we aim to demonstrate grid visualization
%and just will use line name and both sides' nodes.
%Lines with the "-" indicate redundant lines which are disconnected from
%Node_B side.


%%  import Lines data and construct LineObjects, instances from NodeClass.

    lines = importdata('excel_files\Branches.xlsx');
    line_fields = fieldnames(lines.textdata);
    line_cl_tot = 0;
    for mm = 1:numel(line_fields)
        lines.textdata.(line_fields{mm});
        line_cl_tot = line_cl_tot + length(lines.textdata.(line_fields{mm})(:,1))-1;
    end
% --------------------------------------------------------------
    LineObjects = cell(1,line_cl_tot);
    line_counter = 0;
    for i = 1:numel(line_fields)
        lines.textdata.(line_fields{i});
        for j=2:length(lines.textdata.(line_fields{i})(:,1))
            line_counter = line_counter + 1;
            side_a = lines.textdata.(line_fields{i})(j,2);
            side_b = lines.textdata.(line_fields{i})(j,3);
            r_tot = 8.0400e-05;
            LineObjects{line_counter} = LineClass(lines.textdata.(line_fields{i})(j), side_a, side_b, r_tot);
        end
    end
end

