;plot busts on solar disk. This creates Fig 1 of Kleint&Panos, 2021, submitted.
;Lucia Kleint
;September 2021


;------- restore sav file with coordinate info for all bursts --------
restore,'allinfo_pztx_coord.sav',/ve




;plot a simple overview (requires ssw)
plot_helio,allinfo[50000].date_obs,xcor=xcor,ycor=ycor,$
           thick=2,position=[.1,.1,.9,.9],/norm,gthick=2,charthick=2,$
           lthick=2,xrange=[-980,980],yrange=[-980,980],roll=p0

for i=0,n_elements(allinfo.date_obs)-1 do $
   plots,allinfo[i].xcoord,allinfo[i].ycoord,psym=4,color=cgcolor('blue')



;--------- plot for paper -----------------------------------
;color-code IBs on a solar coordinate grid by dates
times = anytim(allinfo.date_obs)
dt = times[-1] - times[0]

set_plot,'PS'
device,filename='ib_locondisk.eps',/color,/encaps,xsize=10,ysize=10
loadct,0
plot_helio,'2013-12-31',xcor=xcor,ycor=ycor,$
           thick=2,position=[.1,.1,.9,.9],/norm,gthick=2,charthick=2,$
           lthick=2,xrange=[-980,980],yrange=[-980,980];,$
        ;   position=[.1,.1,.95,.95],/norm

loadct,33
for i=0.,n_elements(allinfo.date_obs)-1 do $
   plots,allinfo[i].xcoord,allinfo[i].ycoord,psym=4,color=(times[i]-times[0])/dt*255

index=(findgen(n_elements(allinfo.date_obs)))[0:*:20000]
polyfill,[0,0.43,0.43,0,0],[.71,.71,.9,.9,.71],/norm,color=cgcolor('white')
al_legend,[allinfo[index].date_obs],lines=fltarr(n_elements(index))+1,pspacing=1.5,$
          psym=fltarr(n_elements(index))+4,color=round((times[index]-times[0])/dt*255),$
          thick=fltarr(n_elements(index))+2,box=0,charsize=.7,charthick=2,$
          position=[.02,.9],/norm;,poly_fill=1,polycolor=cgcolor('white')

device,/close
set_plot,'x'
$open ib_locondisk.eps

   
END
