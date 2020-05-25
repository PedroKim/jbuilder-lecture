export const fetchSqueaks = () => {
  debugger
  return $.ajax({
    method: "GET",
    url: "/api/squeaks"
  });
};

export const createSqueak = (squeak) => {
  debugger
  return $.ajax({
    method: "POST",
    url: "/api/squeaks",
    data: { squeak: squeak }
  });
}