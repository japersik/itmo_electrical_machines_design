function savef_and_close(filename)
    saveas(gcf,'img\'+string(filename))
    close
end